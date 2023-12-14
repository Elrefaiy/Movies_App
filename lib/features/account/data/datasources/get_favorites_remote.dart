import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/favorite_model.dart';

abstract class GetFavoritesRemoteDataSource {
  Future<FavoriteModel> getFavorites({
    required String sessionId,
  });
}

class GetFavoritesRemoteDataSourceImpl implements GetFavoritesRemoteDataSource {
  final ApiConsumer apiConsumer;

  GetFavoritesRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<FavoriteModel> getFavorites({
    required String sessionId,
  }) async {
    var response = await apiConsumer.get(
      path: EndPoints.favorites,
      queryParameters: {
        'session_id': sessionId,
      },
    );
    return FavoriteModel.fromJson(response);
  }
}
