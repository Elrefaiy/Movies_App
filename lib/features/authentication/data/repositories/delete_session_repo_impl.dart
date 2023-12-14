import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/delete_session.dart';

class DeleteSessionRepoImpl implements DeleteSessionRepo {
  final NetworkInfo networkInfo;
  final ApiConsumer apiConsumer;

  DeleteSessionRepoImpl({
    required this.networkInfo,
    required this.apiConsumer,
  });
  @override
  Future<Either<Failure, String>> deleteSession(String sessionId) async {
    if (await networkInfo.hasConnection) {
      try {
        await apiConsumer.delete(
          path: EndPoints.deleteSession,
          queryParameters: {
            "session_id": sessionId,
          },
        );
        return Right('Session Deleted Succesfully!');
      } catch (error) {
        debugPrint(sessionId);
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
