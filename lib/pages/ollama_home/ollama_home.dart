import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_chat_ui/constants/router.dart';
import 'package:open_chat_ui/utils/validators.dart';

class OllamaHome extends HookConsumerWidget {
  const OllamaHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final urlCtrl =
        useTextEditingController(text: 'http://localhost:11434/api');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ollama Home'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Ollama Server Details',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Gap(12),
                      TextFormField(
                        controller: urlCtrl,
                        validator: FormValidators.validateUrl,
                        decoration: InputDecoration(
                          filled: true,
                          labelText: 'URL',
                          helperText: 'e.g. http://127.0.0.1:11434/api',
                          prefixIcon: const Icon(Icons.web_rounded),
                          suffixIcon: IconButton(
                            onPressed: urlCtrl.clear,
                            icon: const Icon(Icons.clear),
                          ),
                        ),
                      ),
                      const Gap(12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.goNamed(
                                RouteConstants.ollamaChat,
                                extra: {'url': urlCtrl.text.trim()},
                              );
                            }
                          },
                          icon: const Icon(Icons.link_rounded),
                          label: const Text('Connect'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
