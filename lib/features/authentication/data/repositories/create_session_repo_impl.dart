import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/repositories/create_session_repo.dart';
import '../models/session_model.dart';

class CreateSessionRepositoryImpl implements CreateSessionRepo {
  final NetworkInfo networkInfo;
  final ApiConsumer apiConsumer;
  final SharedPreferences sharedPreferences;

  CreateSessionRepositoryImpl({
    required this.networkInfo,
    required this.apiConsumer,
    required this.sharedPreferences,
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
        await sharedPreferences.setString(
          AppStrings.sessionId,
          response['session_id'],
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
