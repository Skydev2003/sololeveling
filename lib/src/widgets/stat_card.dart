import 'package:flutter/material.dart';

import '../models/player.dart';

class StatCard extends StatelessWidget {
  final Player player;

  const StatCard({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    final xpToNext = 100 + (player.level - 1) * 25;
    final progress = (player.xp / xpToNext).clamp(0, 1).toDouble();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(player.name, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Level ${player.level}'),
                Text('${player.xp} / $xpToNext XP'),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(value: progress),
          ],
        ),
      ),
    );
  }
}
