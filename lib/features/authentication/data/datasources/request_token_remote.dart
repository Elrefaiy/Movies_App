import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/request_token_model.dart';

abstract class RequestTokenRemote {
  Future<RequestTokenModel> createRequestTokenRemote();
}

class RequestTokenRemoteImpl implements RequestTokenRemote {
  final ApiConsumer apiConsumer;

  RequestTokenRemoteImpl({required this.apiConsumer});

  @override
  Future<RequestTokenModel> createRequestTokenRemote() async {
    final response = await apiConsumer.get(
      path: EndPoints.requestToken,
    );
    return RequestTokenModel.fromJson(response);
  }
}
