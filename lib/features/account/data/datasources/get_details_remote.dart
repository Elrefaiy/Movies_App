import 'package:movies_application/core/api/api_consumer.dart';
import 'package:movies_application/core/api/end_points.dart';
import 'package:movies_application/features/account/data/models/details_model.dart';

abstract class GetDetailsRemoteDataSource {
  Future<DetailsModel> getAccountDetails({required String sessionId});
}

class GetDetailsRemoteDataSourceImpl implements GetDetailsRemoteDataSource {
  final ApiConsumer apiConsumer;

  GetDetailsRemoteDataSourceImpl({
    required this.apiConsumer,
  });
  @override
  Future<DetailsModel> getAccountDetails({
    required String sessionId,
  }) async {
    var response = await apiConsumer.get(
      path: EndPoints.accountDetails,
      queryParameters: {
        'session_id': sessionId,
      },
    );
    return DetailsModel.fromJson(response);
  }
}
