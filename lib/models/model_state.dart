import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ollama_dart/ollama_dart.dart';
import 'package:open_chat_ui/enums/model_status.dart';

part 'model_state.freezed.dart';
part 'model_state.g.dart';

@freezed
class ModelState with _$ModelState {
  const factory ModelState({
    Model? selectedModel,
    @Default(ModelStatus.idle) ModelStatus status,
    @Default([]) List<GenerateChatCompletionResponse> responses,
  }) = _ModelState;

  factory ModelState.fromJson(Map<String, Object?> json) =>
      _$ModelStateFromJson(json);
}
