class MoviesList {
  int page;
  List<Result> results;
  int totalPages;

  MoviesList({
    required this.page,
    required this.results,
    required this.totalPages,
  });
}

class Result {
  String backdropPath;
  int id;
  String originalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;

  Result({
    required this.backdropPath,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });
}
