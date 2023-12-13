class Favorite {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  Favorite({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}

class Result {
  int id;
  String posterPath;
  double voteAverage;

  Result({
    required this.id,
    required this.posterPath,
    required this.voteAverage,
  });
}
