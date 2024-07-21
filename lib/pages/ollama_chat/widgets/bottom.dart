import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_chat_ui/controllers/ollama_controller.dart';
import 'package:open_chat_ui/enums/model_status.dart';

class BottomInputBar extends HookConsumerWidget {
  const BottomInputBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ollamaCtrl = ref.watch(ollamaControllerProvider.notifier);
    final ollama = ref.watch(ollamaControllerProvider);
    final messageCtrl = useTextEditingController();
    final canSend = useMemoized(
      () =>
          ollama.selectedModel != null &&
          ollama.status == ModelStatus.idle &&
          messageCtrl.text.trim().isNotEmpty,
      [
        ollama,
        useValueListenable(messageCtrl),
      ],
    );

    final sendMessage = useCallback(() {
      ollamaCtrl.sendMessage(messageCtrl.text.trim());
      messageCtrl.clear();
    });

    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              autofocus: true,
              maxLines: 3,
              controller: messageCtrl,
              decoration: const InputDecoration(
                filled: true,
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
          ),
          const Gap(8),
          SizedBox(
            width: 40,
            child: Center(
              child: (ollama.status == ModelStatus.running)
                  ? const CircularProgressIndicator()
                  : IconButton.filled(
                      onPressed: canSend ? sendMessage : null,
                      icon: const Icon(Icons.play_arrow_rounded),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
