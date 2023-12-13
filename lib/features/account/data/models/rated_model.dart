import '../../domain/entities/rated.dart';

class RatedModel extends Rated {
  RatedModel({
    required int page,
    required List<RatedResultModel> results,
    required int totalPages,
    required int totalResults,
  }) : super(
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  factory RatedModel.fromJson(Map<String, dynamic> json) => RatedModel(
        page: json["page"],
        results: List<RatedResultModel>.from(
          json["results"].map(
            (x) => RatedResultModel.fromJson(x),
          ),
        ),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class RatedResultModel extends RatedResult {
  RatedResultModel({
    required int id,
    required String posterPath,
    required double voteAverage,
    required double rating,
  }) : super(
          id: id,
          posterPath: posterPath,
          voteAverage: voteAverage,
          rating: rating,
        );

  factory RatedResultModel.fromJson(Map<String, dynamic> json) =>
      RatedResultModel(
        id: json["id"],
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
      );
}
