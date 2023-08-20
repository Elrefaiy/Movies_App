import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/movies_list_model.dart';

abstract class TopRatedRemoteDataSource {
  Future<MoviesListModel> getTopRatedRemote(int pageNumber);
}

class TopRatedRemoteDataSourceImpl implements TopRatedRemoteDataSource {
  final ApiConsumer apiConsumer;
  TopRatedRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<MoviesListModel> getTopRatedRemote(int pageNumber) async {
    final response = await apiConsumer.get(
      path: EndPoints.topRated,
      queryParameters: {
        'page': pageNumber,
      },
    );
    return MoviesListModel.fromJson(response);
  }
}
