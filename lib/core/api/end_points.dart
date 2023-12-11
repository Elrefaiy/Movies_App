class EndPoints {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String requestToken = '$baseUrl/authentication/token/new';
  static const String createSession = '$baseUrl/authentication/session/new';
  static const String createGuestSession =
      '$baseUrl/authentication/guest_session/new';
  static const String deleteSession = '$baseUrl/authentication/session';
  static const String nowPlaying = '$baseUrl/movie/now_playing';
  static const String popular = '$baseUrl/movie/popular';
  static const String topRated = '$baseUrl/movie/top_rated';
  static const String upcoming = '$baseUrl/movie/upcoming';
  static const String movie = '$baseUrl/movie/';
  static String videos(int id) => '$baseUrl/movie/$id/videos';
  static String credits(int id) => '$baseUrl/movie/$id/credits';
  static String images(int id) => '$baseUrl/movie/$id/images';
  static const String searchMovie = '$baseUrl/search/movie';
  static const String accountDetails = '$baseUrl/account/18279617';
}
