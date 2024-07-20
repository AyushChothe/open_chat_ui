import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_chat_ui/controllers/ollama_controller.dart';
import 'package:open_chat_ui/enums/model_status.dart';

class BottomInputBar extends HookConsumerWidget {
  const BottomInputBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ollamaCtrl = ref.watch(ollamaCtrlProvider.notifier);
    final ollama = ref.watch(ollamaCtrlProvider);
    final messageCtrl = useTextEditingController();

    final canSend = useMemoized(
      () =>
          ollama.status != ModelStatus.running &&
          messageCtrl.text.trim().isNotEmpty,
      [
        ollama,
        useValueListenable(messageCtrl),
      ],
    );

    return Padding(
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageCtrl,
              decoration: const InputDecoration(
                hintText: 'Type a message',
                filled: true,
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              maxLines: 3,
            ),
          ),
          const SizedBox(width: 4),
          IconButton.filled(
            onPressed: canSend
                ? () {
                    ollamaCtrl.sendMessage(messageCtrl.text.trim());
                    messageCtrl.clear();
                  }
                : null,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
