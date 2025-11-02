import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/quest_provider.dart';
import '../widgets/quest_tile.dart';

class QuestsPage extends ConsumerWidget {
  const QuestsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quests = ref.watch(questProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Daily Quests')),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: quests.length,
        itemBuilder: (context, index) => QuestTile(quest: quests[index]),
        separatorBuilder: (_, __) => const SizedBox(height: 8),
      ),
    );
  }
}
