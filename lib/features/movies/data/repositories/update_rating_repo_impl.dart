import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/repositories/update_rating_repo.dart';

class UpdateRatingRepoImpl implements UpdateRatingRepo {
  final ApiConsumer apiConsumer;
  final NetworkInfo networkInfo;
  final SharedPreferences sharedPreferences;

  UpdateRatingRepoImpl({
    required this.apiConsumer,
    required this.networkInfo,
    required this.sharedPreferences,
  });

  @override
  Future<Either<Failure, String>> updateRating(RatingParams params) async {
    if (await networkInfo.hasConnection) {
      try {
        var id = sharedPreferences.getString(AppStrings.sessionId);
        bool isGuest = sharedPreferences.getBool(AppStrings.isGeust)!;
        String key = isGuest ? 'guest_session_id' : 'session_id';
        await apiConsumer.post(
          path: EndPoints.updateRating(params.mediaId),
          queryParameters: {
            key: id,
          },
          body: {
            'value': params.rating * 2,
          },
        );
        return (Right('Rated Successfully!'));
      } catch (error) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
