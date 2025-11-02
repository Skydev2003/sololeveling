import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/player.dart';
import '../providers/player_provider.dart';

class StatCard extends ConsumerStatefulWidget {
  final Player player;

  const StatCard({super.key, required this.player});

  @override
  ConsumerState<StatCard> createState() => _StatCardState();
}

class _StatCardState extends ConsumerState<StatCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scale = Tween<double>(
      begin: 1.0,
      end: 1.18,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    // Listen to player changes to show level-up feedback
    ref.listen<Player>(playerProvider, (previous, next) {
      if (previous != null && next.level > previous.level) {
        _controller.forward(from: 0);
        // show snack bar (level up)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Level up! เลเวลขึ้นเป็น ${next.level}'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final player = widget.player;
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
                ScaleTransition(
                  scale: _scale,
                  child: Text(
                    'Level ${player.level}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
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
