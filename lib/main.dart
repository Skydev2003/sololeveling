import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'src/routes/app_router.dart';
import 'src/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: SololevelingApp()));
}

class SololevelingApp extends ConsumerWidget {
  const SololevelingApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Sololeveling - Fitness RPG',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      routerConfig: router,
    );
  }
}
