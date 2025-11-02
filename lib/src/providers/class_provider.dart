import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/character_class.dart';

final classesProvider = Provider<List<CharacterClass>>((ref) {
  return [
    CharacterClass(
      id: 'warrior',
      name: 'Warrior',
      tagline: 'Power & Endurance',
      description: 'High strength, gains more XP from strength exercises.',
    ),
    CharacterClass(
      id: 'assassin',
      name: 'Assassin',
      tagline: 'Speed & Agility',
      description: 'Excels at quick workouts and sprints.',
    ),
    CharacterClass(
      id: 'mage',
      name: 'Mage',
      tagline: 'Focus & Technique',
      description: 'Precision-based training, gains bonuses for skill work.',
    ),
  ];
});
