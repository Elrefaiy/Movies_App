import '../../domain/entities/favorite.dart';

class FavoriteModel extends Favorite {
  FavoriteModel({
    required int page,
    required List<ResultModel> results,
    required int totalPages,
    required int totalResults,
  }) : super(
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  factory FavoriteModel.fromJson(Map<String, dynamic> json) => FavoriteModel(
        page: json["page"],
        results: List<ResultModel>.from(
          json["results"].map(
            (x) => ResultModel.fromJson(x),
          ),
        ),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class ResultModel extends Result {
  ResultModel({
    required int id,
    required String posterPath,
    required double voteAverage,
  }) : super(
          id: id,
          posterPath: posterPath,
          voteAverage: voteAverage,
        );

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        id: json["id"],
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"]?.toDouble(),
      );
}
