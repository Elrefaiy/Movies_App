class Rated {
  int page;
  List<RatedResult> results;
  int totalPages;
  int totalResults;

  Rated({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}

class RatedResult {
  int id;
  String posterPath;
  double voteAverage;
  double rating;

  RatedResult({
    required this.id,
    required this.posterPath,
    required this.voteAverage,
    required this.rating,
  });

  factory RatedResult.fromJson(Map<String, dynamic> json) => RatedResult(
        id: json["id"],
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
      );
}
