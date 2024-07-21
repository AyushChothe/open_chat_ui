import 'package:ollama_dart/ollama_dart.dart';
import 'package:open_chat_ui/enums/model_status.dart';
import 'package:open_chat_ui/models/model_state.dart';
import 'package:open_chat_ui/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ollama_controller.g.dart';

@riverpod
String? ollamaBaseUrl(OllamaBaseUrlRef ref) => null;

@Riverpod(dependencies: [OllamaController])
Future<List<Model>> models(ModelsRef ref) {
  final ollamaCtrl = ref.watch(ollamaControllerProvider.notifier);
  return ollamaCtrl.getModels();
}

@Riverpod(dependencies: [ollamaBaseUrl])
class OllamaController extends _$OllamaController {
  @override
  ModelState build() {
    baseUrl = ref.watch(ollamaBaseUrlProvider)!;
    return const ModelState();
  }

  late final String baseUrl;
  OllamaClient get _client => OllamaClient(baseUrl: baseUrl);

  Future<List<Model>> getModels() {
    return _client.listModels().then((val) => val.models ?? []);
  }

  void selectModel(Model? model) {
    state = state.copyWith(selectedModel: model);
  }

  void clear() {
    state = state.copyWith(
      status: ModelStatus.idle,
      responses: [],
    );
  }

  Future<void> sendMessage(String message) async {
    try {
      state = state.copyWith(status: ModelStatus.running);
      state = state.copyWith(
        responses: [
          ...state.responses,
          GenerateChatCompletionResponse(
            message: Message(role: MessageRole.user, content: message),
          ),
        ],
      );
      final resStream = _client.generateChatCompletionStream(
        request: GenerateChatCompletionRequest(
          model: state.selectedModel!.model!,
          messages: state.responses.map((e) => e.message!).toList(),
          stream: true,
        ),
      );

      bool isFirstChunk = true;
      await for (final res in resStream) {
        if (isFirstChunk) {
          // Add new message
          state = state.copyWith(
            responses: [
              ...state.responses,
              res.copyWith(
                message: res.message!.copyWith(
                  content: res.message!.content.trimLeft(),
                ),
              ),
            ],
          );
          isFirstChunk = false;
        } else {
          // Add content to last message
          final lastResponse = state.responses.last;
          state = state.copyWith(
            responses: [
              ...state.responses.sublist(0, state.responses.length - 1),
              res.copyWith(
                message: res.message!.copyWith(
                  content: lastResponse.message!.content +
                      (res.done ?? false
                          ? res.message!.content.trimRight()
                          : res.message!.content),
                ),
              ),
            ],
          );
        }
      }
    } catch (e) {
      Utils.showMessage('Something went wrong');
      state = state.copyWith(status: ModelStatus.error);
      rethrow;
    } finally {
      state = state.copyWith(status: ModelStatus.idle);
    }
  }
}
