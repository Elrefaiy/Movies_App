import '../../domain/entities/saved_movie.dart';

class SavedMovieModel extends SavedMovie {
  SavedMovieModel({
    required int page,
    required List<SMResultModel> results,
    required int totalPages,
    required int totalResults,
  }) : super(
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  factory SavedMovieModel.fromJson(Map<String, dynamic> json) =>
      SavedMovieModel(
        page: json["page"],
        results: List<SMResultModel>.from(
          json["results"].map(
            (x) => SMResultModel.fromJson(x),
          ),
        ),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class SMResultModel extends SMResult {
  SMResultModel({
    required int id,
    required String posterPath,
    required double voteAverage,
  }) : super(
          id: id,
          posterPath: posterPath,
          voteAverage: voteAverage,
        );

  factory SMResultModel.fromJson(Map<String, dynamic> json) => SMResultModel(
        id: json["id"],
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"]?.toDouble(),
      );
}
