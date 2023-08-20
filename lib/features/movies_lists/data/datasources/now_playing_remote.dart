import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/movies_list_model.dart';

abstract class NowPlayingRemoteDataSource {
  Future<MoviesListModel> getNowPlayingRemote(int pageNumber);
}

class NowPlayingRemoteDataSourceImpl implements NowPlayingRemoteDataSource {
  final ApiConsumer apiConsumer;
  NowPlayingRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<MoviesListModel> getNowPlayingRemote(int pageNumber) async {
    final response = await apiConsumer.get(
      path: EndPoints.nowPlaying,
      queryParameters: {
        'page': pageNumber,
      },
    );
    return MoviesListModel.fromJson(response);
  }
}
