import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/player_provider.dart';
import '../widgets/stat_card.dart';

class StatusPage extends ConsumerWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(playerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Status')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StatCard(player: player),
        ),
      ),
    );
  }
}
