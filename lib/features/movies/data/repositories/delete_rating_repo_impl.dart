import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/repositories/delete_rating_repo.dart';

class DeleteRatingRepoImpl implements DeleteRatingRepo {
  final ApiConsumer apiConsumer;
  final NetworkInfo networkInfo;
  final SharedPreferences sharedPreferences;

  DeleteRatingRepoImpl({
    required this.apiConsumer,
    required this.networkInfo,
    required this.sharedPreferences,
  });

  @override
  Future<Either<Failure, String>> deleteRating(int params) async {
    if (await networkInfo.hasConnection) {
      try {
        var id = sharedPreferences.getString(AppStrings.sessionId);
        bool isGuest = sharedPreferences.getBool(AppStrings.isGeust)!;
        String key = isGuest ? 'guest_session_id' : 'session_id';
        await apiConsumer.delete(
          path: EndPoints.updateRating(params),
          queryParameters: {
            key: id,
          },
        );
        return (Right('Rate Deleted Successfully!'));
      } catch (error) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
