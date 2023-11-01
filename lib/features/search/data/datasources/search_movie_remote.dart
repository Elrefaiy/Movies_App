import '../../../../core/api/end_points.dart';

import '../../../../core/api/api_consumer.dart';
import '../models/search_movie_model.dart';

abstract class SearchMovieRemoteDataSource {
  Future<SearchMovieModel> searchMovie({required String title});
}

class SearchMovieRemoteDataSourceImpl implements SearchMovieRemoteDataSource {
  final ApiConsumer apiConsumer;
  SearchMovieRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<SearchMovieModel> searchMovie({
    required String title,
  }) async {
    final response = await apiConsumer.get(
      path: EndPoints.searchMovie,
      queryParameters: {
        'query': title,
      },
    );
    return SearchMovieModel.fromJson(response);
  }
}
