class EndPoints {
  static const String baseUrl = 'https://api.themoviedb.org';
  static const String nowPlaying = '$baseUrl/3/movie/now_playing';
  static const String popular = '$baseUrl/3/movie/popular';
  static const String topRated = '$baseUrl/3/movie/top_rated';
  static const String upcoming = '$baseUrl/3/movie/upcoming';
  static const String movie = '$baseUrl/3/movie/';
  static String videos(int id) => '$baseUrl/3/movie/$id/videos';
  static String credits(int id) => '$baseUrl/3/movie/$id/credits';
}
// eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NTIzMDczOTNkZjdkYmU3NTUzOTMyZWY4ZTViYWJmOSIsInN1YiI6IjY0MTA4NzI2YzM5MGM1MDA3OTZmN2YxZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.NqF6KDkr-FkoAQ3pP9sTthXBjcKdudV1dHtDQo_Y4-0