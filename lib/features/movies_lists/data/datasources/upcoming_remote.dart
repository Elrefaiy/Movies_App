import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/movies_list_model.dart';

abstract class UpcomingRemoteDataSource {
  Future<MoviesListModel> getUpcomingRemote(int pageNumber);
}

class UpcomingRemoteDataSourceImpl implements UpcomingRemoteDataSource {
  final ApiConsumer apiConsumer;
  UpcomingRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<MoviesListModel> getUpcomingRemote(int pageNumber) async {
    final response = await apiConsumer.get(
      path: EndPoints.upcoming,
      queryParameters: {
        'page': pageNumber,
      },
    );
    return MoviesListModel.fromJson(response);
  }
}
