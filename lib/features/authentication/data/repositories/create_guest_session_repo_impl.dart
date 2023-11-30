import 'package:dartz/dartz.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/create_guest_session_repo.dart';
import '../models/guest_session_model.dart';

class CreateGuestSessionRepoImpl implements CreateGuestSessionRepo {
  final NetworkInfo networkInfo;
  final ApiConsumer apiConsumer;

  CreateGuestSessionRepoImpl({
    required this.networkInfo,
    required this.apiConsumer,
  });
  @override
  Future<Either<Failure, GuestSessionModel>> createGuestSession() async {
    if (await networkInfo.hasConnection) {
      try {
        var response = await apiConsumer.get(
          path: EndPoints.createGuestSession,
        );
        return Right(GuestSessionModel.fromJson(response));
      } catch (error) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
