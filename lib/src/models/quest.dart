class Quest {
  final String id;
  final String title;
  final String description;
  final int xpReward;
  final bool completed;
  final DateTime date;

  Quest({
    required this.id,
    required this.title,
    required this.description,
    required this.xpReward,
    required this.completed,
    required this.date,
  });

  Quest copyWith({bool? completed}) {
    return Quest(
      id: id,
      title: title,
      description: description,
      xpReward: xpReward,
      completed: completed ?? this.completed,
      date: date,
    );
  }
}
