class SavedMovie {
  int page;
  List<SMResult> results;
  int totalPages;
  int totalResults;

  SavedMovie({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
}

class SMResult {
  int id;
  String posterPath;
  double voteAverage;

  SMResult({
    required this.id,
    required this.posterPath,
    required this.voteAverage,
  });

  factory SMResult.fromJson(Map<String, dynamic> json) => SMResult(
        id: json["id"],
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"]?.toDouble(),
      );
}
