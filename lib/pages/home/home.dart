import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_chat_ui/controllers/ollama_controller.dart';
import 'package:open_chat_ui/pages/home/widgets/bottom.dart';
import 'package:open_chat_ui/pages/home/widgets/messages_view.dart';
import 'package:open_chat_ui/pages/home/widgets/model_selector.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ollamaCtrl = ref.watch(ollamaCtrlProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
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
