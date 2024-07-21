import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_chat_ui/controllers/ollama_controller.dart';
import 'package:open_chat_ui/utils/utils.dart';

class ModelSelector extends HookConsumerWidget {
  const ModelSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ollamaCtrl = ref.watch(ollamaControllerProvider.notifier);
    final modelsValue = ref.watch(modelsProvider);
    return modelsValue.when(
      data: (models) => Row(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, box) {
                return DropdownMenu(
                  inputDecorationTheme: const InputDecorationTheme(
                    filled: true,
                  ),
                  enableFilter: true,
                  requestFocusOnTap: true,
                  leadingIcon: const Icon(Icons.search),
                  label: const Text('Model'),
                  hintText: 'Select a model',
                  width: box.maxWidth,
                  dropdownMenuEntries: models
                      .map(
                        (e) => DropdownMenuEntry(
                          value: e,
                          label: '${e.model}',
                          leadingIcon: const Icon(Icons.lightbulb_rounded),
                          labelWidget: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: e.model,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: ' (${Utils.bytesToSize(e.size)})',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onSelected: ollamaCtrl.selectModel,
                );
              },
            ),
          ),
          const Gap(4),
          IconButton.filledTonal(
            onPressed: () {
              ref.invalidate(modelsProvider);
              Utils.showMessage('Models refreshed');
            },
            icon: const Icon(Icons.refresh_rounded),
          )
        ],
      ),
      error: (e, st) => Text(modelsValue.error.toString()),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
