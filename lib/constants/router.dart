import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_chat_ui/controllers/ollama_controller.dart';
import 'package:open_chat_ui/pages/home/home.dart';
import 'package:open_chat_ui/pages/ollama_chat/ollama_chat.dart';
import 'package:open_chat_ui/pages/ollama_home/ollama_home.dart';

class RouteConstants {
  static const String home = '/';
  static const String ollama = 'ollama';
  static const String ollamaChat = 'chat';
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: RouteConstants.home,
      name: RouteConstants.home,
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: RouteConstants.ollama,
          name: RouteConstants.ollama,
          builder: (context, state) => const OllamaHome(),
          routes: [
            GoRoute(
              path: RouteConstants.ollamaChat,
              name: RouteConstants.ollamaChat,
              redirect: (context, state) {
                final url = (state.extra as Map<String, String>?)?['url'];
                return url == null ? '/${RouteConstants.ollama}' : null;
              },
              builder: (context, state) => ProviderScope(
                overrides: [
                  ollamaBaseUrlProvider.overrideWithValue(
                    (state.extra! as Map<String, String>)['url'],
                  )
                ],
                child: const OllamaChat(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
