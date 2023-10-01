import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../models/credit_model.dart';

abstract class CreditRemoteDataSource {
  Future<CreditModel> getCreditRemote({required int id});
}

class CreditRemoteDataSourceImpl implements CreditRemoteDataSource {
  final ApiConsumer apiConsumer;

  CreditRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<CreditModel> getCreditRemote({required int id}) async {
    final response = await apiConsumer.get(path: EndPoints.credits(id));
    return CreditModel.fromJson(response);
  }
}
