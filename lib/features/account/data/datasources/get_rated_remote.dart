import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/rated_model.dart';

abstract class GetRatedRemoteDataSource {
  Future<RatedModel> getRated({
    required String sessionId,
  });
}

class GetRatedRemoteDataSourceImpl implements GetRatedRemoteDataSource {
  final ApiConsumer apiConsumer;

  GetRatedRemoteDataSourceImpl({
    required this.apiConsumer,
  });

  @override
  Future<RatedModel> getRated({
    required String sessionId,
  }) async {
    var response = await apiConsumer.get(
      path: EndPoints.rated,
      queryParameters: {
        'session_id': sessionId,
      },
    );
    return RatedModel.fromJson(response);
  }
}
