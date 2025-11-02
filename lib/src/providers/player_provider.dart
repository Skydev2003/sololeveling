import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/player.dart';

int xpToLevel(int level) => 100 + (level - 1) * 25;

class PlayerNotifier extends StateNotifier<Player> {
  PlayerNotifier() : super(const Player(name: 'Rookie', level: 1, xp: 0));

  void addXp(int amount) {
    var newXp = state.xp + amount;
    var level = state.level;

    while (newXp >= xpToLevel(level)) {
      newXp -= xpToLevel(level);
      level++;
    }

    state = state.copyWith(level: level, xp: newXp);
  }
}

final playerProvider = StateNotifierProvider<PlayerNotifier, Player>((ref) {
  return PlayerNotifier();
});
