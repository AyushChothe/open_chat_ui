import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown_widget/config/configs.dart';
import 'package:markdown_widget/widget/blocks/leaf/code_block.dart';
import 'package:markdown_widget/widget/markdown_block.dart';
import 'package:ollama_dart/ollama_dart.dart';
import 'package:open_chat_ui/controllers/ollama_controller.dart';

class MessagesView extends HookConsumerWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ollama = ref.watch(ollamaControllerProvider);

    final reversedResponses = useMemoized(
      ollama.responses.reversed.toList,
      [ollama.responses],
    );

    return Scrollbar(
      child: ListView.separated(
        reverse: true,
        itemCount: reversedResponses.length,
        itemBuilder: (context, index) {
          final response = reversedResponses[index];
          final isUserMsg = response.message!.role == MessageRole.user;
          return Align(
            alignment: isUserMsg ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(12),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.8,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.bodyLarge!,
                    child: MarkdownBlock(
                      data: response.message!.content,
                      config: MarkdownConfig.defaultConfig.copy(
                        configs: [
                          const PreConfig(theme: githubTheme),
                        ],
                      ),
                      // style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  if (!isUserMsg && (response.done ?? false)) ...[
                    const Divider(),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: response.evalCount.toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(text: ' tokens in '),
                          TextSpan(
                            text: ((response.evalDuration ?? 0) / 1000000)
                                .toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(text: ' ms'),
                        ],
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 12),
      ),
    );
  }
}
