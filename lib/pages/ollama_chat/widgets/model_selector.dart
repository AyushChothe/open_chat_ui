import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_chat_ui/controllers/ollama_controller.dart';

class ModelSelector extends HookConsumerWidget {
  const ModelSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ollamaCtrl = ref.watch(ollamaControllerProvider.notifier);
    final ollama = ref.watch(ollamaControllerProvider);
    final modelsValue = ref.watch(modelsProvider);
    return Card(
      child: modelsValue.when(
        data: (models) => SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: DropdownButton(
              underline: const SizedBox.shrink(),
              hint: const Text('Select Model'),
              value: ollama.selectedModel,
              items: models
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text('${e.model}${e.size}'),
                    ),
                  )
                  .toList(),
              onChanged: ollamaCtrl.selectModel,
            ),
          ),
        ),
        error: (e, st) => Text(modelsValue.error.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
