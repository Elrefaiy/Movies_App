class SearchMovie {
  int page;
  List<SearchResult> results;
  int totalPages;
  int totalResults;

  SearchMovie({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}

class SearchResult {
  String? backdropPath;
  int id;
  String originalTitle;
  String title;
  String overview;
  String? posterPath;
  String releaseDate;
  double voteAverage;
  int voteCount;
  double popularity;

  SearchResult({
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
