import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/player_provider.dart';
import '../widgets/stat_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(playerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sololeveling')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StatCard(player: player),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => context.go('/status'),
              icon: const Icon(Icons.insights),
              label: const Text('View Status'),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => context.go('/classes'),
              icon: const Icon(Icons.shield),
              label: const Text('Choose Class'),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => context.go('/quests'),
              icon: const Icon(Icons.task),
              label: const Text('Daily Quests'),
            ),
          ],
        ),
      ),
    );
  }
}
