import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/class_provider.dart';

class ClassesPage extends ConsumerWidget {
  const ClassesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classes = ref.watch(classesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('คลาส (Classes)')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisExtent: 110,
            childAspectRatio: 3.6,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: classes.length,
          itemBuilder: (context, index) {
            final c = classes[index];
            final colors = [Colors.deepPurple.shade700, Colors.purple.shade400];
            final icon =
                index == 0
                    ? Icons.fitness_center
                    : index == 1
                    ? Icons.flash_on
                    : Icons.auto_fix_high;

            return InkWell(
              onTap: () {
                // later: select class
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('เลือกคลาส: ${c.name}')));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: colors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundColor: Colors.white24,
                      child: Icon(icon, color: Colors.white, size: 28),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            c.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            c.tagline,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right, color: Colors.white70),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
