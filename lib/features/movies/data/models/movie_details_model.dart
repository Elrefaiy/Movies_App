import '../../domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  MovieDetailsModel({
    required String backdropPath,
    required int budget,
    required List<GenreModel> genres,
    required int id,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String posterPath,
    required String releaseDate,
    required int revenue,
    required int runtime,
    required String status,
    required String tagline,
    required String title,
    required double voteAverage,
    required int voteCount,
  }) : super(
          backdropPath: backdropPath,
          budget: budget,
          genres: genres,
          id: id,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          revenue: revenue,
          runtime: runtime,
          status: status,
          tagline: tagline,
          title: title,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backdropPath: json["backdrop_path"],
        budget: json["budget"],
        genres: List<GenreModel>.from(
          json["genres"].map(
            (x) => GenreModel.fromJson(x),
          ),
        ),
        id: json["id"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        revenue: json["revenue"],
        runtime: json["runtime"],
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );
}

class GenreModel extends Genre {
  GenreModel({
    required int id,
    required String name,
  }) : super(id: id, name: name);

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
      );
}
