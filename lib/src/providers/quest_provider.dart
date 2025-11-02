import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/quest.dart';
import 'player_provider.dart';

final _uuid = Uuid();

List<Quest> _generateDaily() {
  final today = DateTime.now();
  return [
    Quest(
      id: _uuid.v4(),
      title: 'Morning Jog',
      description: 'Run 20 minutes at comfortable pace',
      xpReward: 20,
      completed: false,
      date: today,
    ),
    Quest(
      id: _uuid.v4(),
      title: 'Push-up Set',
      description: '3 sets of 12 push-ups',
      xpReward: 15,
      completed: false,
      date: today,
    ),
    Quest(
      id: _uuid.v4(),
      title: 'Core Training',
      description: 'Plank 3 x 60s',
      xpReward: 18,
      completed: false,
      date: today,
    ),
  ];
}

class QuestNotifier extends StateNotifier<List<Quest>> {
  final Ref ref;
  QuestNotifier(this.ref) : super(_generateDaily());

  void toggle(String id) {
    state =
        state.map((q) {
          if (q.id != id) return q;
          final toggled = q.copyWith(completed: !q.completed);
          if (toggled.completed) {
            // reward XP when completed
            ref.read(playerProvider.notifier).addXp(toggled.xpReward);
          }
          return toggled;
        }).toList();
  }
}

final questProvider = StateNotifierProvider<QuestNotifier, List<Quest>>((ref) {
  return QuestNotifier(ref);
});
