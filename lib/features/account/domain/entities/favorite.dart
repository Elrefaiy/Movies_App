class Favorite {
  int page;
  List<FavResult> results;
  int totalPages;
  int totalResults;

  Favorite({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}

class FavResult {
  int id;
  String posterPath;
  double voteAverage;

  FavResult({
    required this.id,
    required this.posterPath,
    required this.voteAverage,
  });
}
