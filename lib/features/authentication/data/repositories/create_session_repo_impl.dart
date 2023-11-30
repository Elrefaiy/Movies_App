import 'package:dartz/dartz.dart';
import 'package:movies_application/core/api/api_consumer.dart';
import 'package:movies_application/core/api/end_points.dart';
import 'package:movies_application/core/errors/failures.dart';
import 'package:movies_application/core/network/network_info.dart';
import 'package:movies_application/features/authentication/data/models/session_model.dart';
import 'package:movies_application/features/authentication/domain/repositories/create_session_repo.dart';

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
