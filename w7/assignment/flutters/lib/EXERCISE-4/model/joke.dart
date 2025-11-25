class Joke {
  final String title;
  final String description;
  bool isFavorite;

  Joke({
    required this.title,
    required this.description,
    this.isFavorite = false,
  });
}
