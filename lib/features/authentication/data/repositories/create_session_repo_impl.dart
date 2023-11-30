import 'package:dartz/dartz.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../models/session_model.dart';
import '../../domain/repositories/create_session_repo.dart';

class CreateSessionRepositoryImpl implements CreateSessionRepo {
  final NetworkInfo networkInfo;
  final ApiConsumer apiConsumer;

  CreateSessionRepositoryImpl({
    required this.networkInfo,
    required this.apiConsumer,
  });
  @override
  Future<Either<Failure, SessionModel>> createSession({
    required String requestToken,
  }) async {
    if (await networkInfo.hasConnection) {
      try {
        var response = await apiConsumer.post(
          path: EndPoints.createSession,
          body: {
            "request_token": requestToken,
          },
        );
        return Right(SessionModel.fromJson(response));
      } catch (error) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
