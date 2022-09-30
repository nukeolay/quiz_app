class Category {
  final int id;
  final String title;
  const Category({required this.id, required this.title});

  @override
  String toString() {
    return '$title ($id)';
  }
}
