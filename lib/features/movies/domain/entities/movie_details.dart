class MovieDetails {
  String backdropPath;
  int budget;
  List<Genre> genres;
  int id;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  int revenue;
  int runtime;
  String status;
  String tagline;
  String title;
  double voteAverage;
  int voteCount;

  MovieDetails({
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.status,
    required this.tagline,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });
}
