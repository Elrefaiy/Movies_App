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
  String? backdropPath;
  int id;
  String originalTitle;
  String title;
  String overview;
  String posterPath;
  String releaseDate;
  double voteAverage;
  int voteCount;
  double popularity;

  Result({
    required this.backdropPath,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.popularity,
    required this.title,
    required this.voteCount,
  });
}
