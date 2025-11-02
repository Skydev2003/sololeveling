import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/quest.dart';
import '../providers/quest_provider.dart';

class QuestTile extends ConsumerWidget {
  final Quest quest;

  const QuestTile({super.key, required this.quest});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text(quest.title),
        subtitle: Text(quest.description),
        trailing: IconButton(
          icon: Icon(
            quest.completed ? Icons.check_circle : Icons.radio_button_unchecked,
            color: quest.completed ? Colors.greenAccent : null,
          ),
          onPressed: () => ref.read(questProvider.notifier).toggle(quest.id),
        ),
      ),
    );
  }
}
