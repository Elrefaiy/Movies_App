import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/saved_movie_model.dart';

abstract class GetWatchlistRemoteDataSource {
  Future<SavedMovieModel> getWatchlist({
    required String sessionId,
  });
}

class GetWatchlistRemoteDataSourceImpl implements GetWatchlistRemoteDataSource {
  final ApiConsumer apiConsumer;

  GetWatchlistRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<SavedMovieModel> getWatchlist({
    required String sessionId,
  }) async {
    var response = await apiConsumer.get(
      path: EndPoints.watchlist,
      queryParameters: {
        'session_id': sessionId,
      },
    );
    return SavedMovieModel.fromJson(response);
  }
}
