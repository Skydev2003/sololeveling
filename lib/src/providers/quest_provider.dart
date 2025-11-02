import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../models/quest.dart';
import 'player_provider.dart';

final _uuid = Uuid();
const _questsPrefsKey = 'quests_v1';

List<Quest> _generateDaily() {
  final today = DateTime.now();
  return [
    Quest(
      id: _uuid.v4(),
      title: 'Morning Jog',
      description: 'วิ่งเบา 20 นาที',
      xpReward: 20,
      completed: false,
      date: today,
    ),
    Quest(
      id: _uuid.v4(),
      title: 'Push-up Set',
      description: '3 เซ็ต 12 ครั้ง',
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
  QuestNotifier(this.ref) : super([]) {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_questsPrefsKey);
    if (raw == null) {
      state = _generateDaily();
      _save();
      return;
    }

    try {
      final list = jsonDecode(raw) as List<dynamic>;
      state =
          list.map((e) {
            final m = e as Map<String, dynamic>;
            return Quest(
              id: m['id'] as String,
              title: m['title'] as String,
              description: m['description'] as String,
              xpReward: m['xpReward'] as int,
              completed: m['completed'] as bool,
              date: DateTime.parse(m['date'] as String),
            );
          }).toList();
    } catch (_) {
      state = _generateDaily();
      _save();
    }
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final list =
        state
            .map(
              (q) => {
                'id': q.id,
                'title': q.title,
                'description': q.description,
                'xpReward': q.xpReward,
                'completed': q.completed,
                'date': q.date.toIso8601String(),
              },
            )
            .toList();
    await prefs.setString(_questsPrefsKey, jsonEncode(list));
  }

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
    _save();
  }
}

final questProvider = StateNotifierProvider<QuestNotifier, List<Quest>>((ref) {
  return QuestNotifier(ref);
});
