import '../../domain/entities/search_movie.dart';

class SearchMovieModel extends SearchMovie {
  SearchMovieModel({
    required int page,
    required List<SearchResultModel> results,
    required int totalPages,
    required int totalResults,
  }) : super(
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) =>
      SearchMovieModel(
        page: json["page"],
        results: List<SearchResultModel>.from(
          json["results"].map(
            (x) => SearchResultModel.fromJson(x),
          ),
        ),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "results": results,
        "totalPages": totalPages,
      };
}

class SearchResultModel extends SearchResult {
  SearchResultModel({
    required String? backdropPath,
    required int id,
    required String originalTitle,
    required String overview,
    required String? posterPath,
    required String releaseDate,
    required double voteAverage,
    required double popularity,
    required String title,
    required int voteCount,
  }) : super(
          backdropPath: backdropPath,
          id: id,
          originalTitle: originalTitle,
          overview: overview,
          posterPath: posterPath,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          popularity: popularity,
          title: title,
          voteCount: voteCount,
        );

  factory SearchResultModel.fromJson(Map<String, dynamic> json) =>
      SearchResultModel(
        backdropPath: json["backdrop_path"] ?? '',
        id: json["id"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"] ?? '',
        releaseDate: json["release_date"],
        voteAverage: json["vote_average"]?.toDouble(),
        popularity: json["popularity"]?.toDouble(),
        title: json["title"],
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toMap() => {
        "backdrop_path": backdropPath,
        "id": id,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "vote_average": voteAverage,
        "popularity": popularity,
        "title": title,
        "vote_count": voteCount,
      };
}
