class Difficulty {
  final int id;
  final String title;
  const Difficulty({required this.id, required this.title});

  @override
  String toString() {
    return '$title ($id)';
  }
}