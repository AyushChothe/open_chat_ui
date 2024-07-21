import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_chat_ui/controllers/ollama_controller.dart';
import 'package:open_chat_ui/pages/ollama_chat/widgets/bottom.dart';
import 'package:open_chat_ui/pages/ollama_chat/widgets/messages_view.dart';
import 'package:open_chat_ui/pages/ollama_chat/widgets/model_selector.dart';

class OllamaChat extends HookConsumerWidget {
  const OllamaChat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ollamaCtrl = ref.watch(ollamaControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          IconButton(
            onPressed: ollamaCtrl.clear,
            icon: const Icon(Icons.clear_all_rounded),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          children: [
            ModelSelector(),
            Divider(),
            Expanded(child: MessagesView()),
            Divider(),
            BottomInputBar(),
          ],
        ),
      ),
    );
  }
}
