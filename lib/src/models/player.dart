class Player {
  final String name;
  final int level;
  final int xp;

  const Player({required this.name, required this.level, required this.xp});

  Player copyWith({String? name, int? level, int? xp}) {
    return Player(
      name: name ?? this.name,
      level: level ?? this.level,
      xp: xp ?? this.xp,
    );
  }

  @override
  String toString() => 'Player(name: $name, level: $level, xp: $xp)';
}
