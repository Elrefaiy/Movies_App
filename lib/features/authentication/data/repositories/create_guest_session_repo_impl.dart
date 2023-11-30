import 'package:dartz/dartz.dart';
import '../../../../core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/create_guest_session_repo.dart';
import '../models/guest_session_model.dart';

class CreateGuestSessionRepoImpl implements CreateGuestSessionRepo {
  final NetworkInfo networkInfo;
  final ApiConsumer apiConsumer;
  final SharedPreferences sharedPreferences;

  CreateGuestSessionRepoImpl({
    required this.networkInfo,
    required this.apiConsumer,
    required this.sharedPreferences,
  });
  @override
  Future<Either<Failure, GuestSessionModel>> createGuestSession() async {
    if (await networkInfo.hasConnection) {
      try {
        var response = await apiConsumer.get(
          path: EndPoints.createGuestSession,
        );
        await sharedPreferences.setString(
          AppStrings.guestSession,
          response['guest_session_id'],
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
