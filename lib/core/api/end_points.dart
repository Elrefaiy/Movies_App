class EndPoints {
  static const String baseUrl = 'https://api.themoviedb.org';
  static const String nowPlaying = '$baseUrl/3/movie/now_playing';
  static const String popular = '$baseUrl/3/movie/popular';
  static const String topRated = '$baseUrl/3/movie/top_rated';
  static const String upcoming = '$baseUrl/3/movie/upcoming';
  static const String movie = '$baseUrl/3/movie/';
  static String videos(int id) => '$baseUrl/3/movie/$id/videos';
  static String credits(int id) => '$baseUrl/3/movie/$id/credits';
  static const String searchMovie = '$baseUrl/3/search/movie';
}
