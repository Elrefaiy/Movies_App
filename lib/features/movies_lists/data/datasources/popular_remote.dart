import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/movies_list_model.dart';

abstract class PopularRemoteDataSource {
  Future<MoviesListModel> getPopularRemote(int pageNumber);
}

class PopularRemoteDataSourceImpl implements PopularRemoteDataSource {
  final ApiConsumer apiConsumer;
  PopularRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<MoviesListModel> getPopularRemote(int pageNumber) async {
    final response = await apiConsumer.get(
      path: EndPoints.popular,
      queryParameters: {
        'page': pageNumber,
      },
    );
    return MoviesListModel.fromJson(response);
  }
}
