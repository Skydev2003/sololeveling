import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/class_provider.dart';

class ClassesPage extends ConsumerWidget {
  const ClassesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classes = ref.watch(classesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Classes')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final c = classes[index];
          return Card(
            child: ListTile(
              title: Text(c.name),
              subtitle: Text(c.tagline),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemCount: classes.length,
      ),
    );
  }
}
