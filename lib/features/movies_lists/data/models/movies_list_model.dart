import '../../domain/entities/movies_list.dart';

class MoviesListModel extends MoviesList {
  MoviesListModel({
    required int page,
    required List<ResultModel> results,
    required int totalPages,
  }) : super(
          page: page,
          results: results,
          totalPages: totalPages,
        );

  factory MoviesListModel.fromJson(Map<String, dynamic> json) =>
      MoviesListModel(
        page: json["page"],
        results: List<ResultModel>.from(
            json["results"].map((x) => ResultModel.fromJson(x))),
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "results": results,
        "totalPages": totalPages,
      };
}

class ResultModel extends Result {
  ResultModel({
    required String backdropPath,
    required int id,
    required String originalTitle,
    required String overview,
    required String posterPath,
    required String releaseDate,
    required double voteAverage,
  }) : super(
          backdropPath: backdropPath,
          id: id,
          originalTitle: originalTitle,
          overview: overview,
          posterPath: posterPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
        );

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        voteAverage: json["vote_average"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "backdrop_path": backdropPath,
        "id": id,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "vote_average": voteAverage,
      };
}