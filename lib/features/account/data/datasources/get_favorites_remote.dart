import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/saved_movie_model.dart';

abstract class GetFavoritesRemoteDataSource {
  Future<SavedMovieModel> getFavorites({
    required String sessionId,
  });
}

class GetFavoritesRemoteDataSourceImpl implements GetFavoritesRemoteDataSource {
  final ApiConsumer apiConsumer;

  GetFavoritesRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<SavedMovieModel> getFavorites({
    required String sessionId,
  }) async {
    var response = await apiConsumer.get(
      path: EndPoints.favorites,
      queryParameters: {
        'session_id': sessionId,
      },
    );
    return SavedMovieModel.fromJson(response);
  }
}
