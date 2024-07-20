import 'package:go_router/go_router.dart';
import 'package:open_chat_ui/pages/home/home.dart';

class RouteConstants {
  static const String home = '/';
}

final router = GoRouter(
  routes: [
    GoRoute(
      path: RouteConstants.home,
      name: RouteConstants.home,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
