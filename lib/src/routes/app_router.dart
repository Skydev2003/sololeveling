import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';
import '../pages/status_page.dart';
import '../pages/classes_page.dart';
import '../pages/quests_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const HomePage()),
      GoRoute(path: '/status', builder: (context, state) => const StatusPage()),
      GoRoute(
        path: '/classes',
        builder: (context, state) => const ClassesPage(),
      ),
      GoRoute(path: '/quests', builder: (context, state) => const QuestsPage()),
    ],
  );
});
