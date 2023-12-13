import '../../domain/entities/favorite.dart';

class FavoriteModel extends Favorite {
  FavoriteModel({
    required int page,
    required List<FavResultModel> results,
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
        results: List<FavResultModel>.from(
          json["results"].map(
            (x) => FavResultModel.fromJson(x),
          ),
        ),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class FavResultModel extends FavResult {
  FavResultModel({
    required int id,
    required String posterPath,
    required double voteAverage,
  }) : super(
          id: id,
          posterPath: posterPath,
          voteAverage: voteAverage,
        );

  factory FavResultModel.fromJson(Map<String, dynamic> json) => FavResultModel(
        id: json["id"],
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"]?.toDouble(),
      );
}
