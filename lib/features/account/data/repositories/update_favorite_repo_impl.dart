import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/repositories/update_favorite.dart';

class UpdateFavoriteRepoImpl implements UpdateFavoriteRepo {
  final ApiConsumer apiConsumer;
  final NetworkInfo networkInfo;
  final SharedPreferences sharedPreferences;

  UpdateFavoriteRepoImpl({
    required this.apiConsumer,
    required this.networkInfo,
    required this.sharedPreferences,
  });

  @override
  Future<Either<Failure, String>> updateFavorites(FavoriteParams params) async {
    if (await networkInfo.hasConnection) {
      try {
        String id = sharedPreferences.getString(AppStrings.sessionId)!;
        await apiConsumer.post(
          path: EndPoints.updateFavorite,
          body: {
            "media_type": params.mediaType,
            "media_id": params.mediaId,
            "favorite": params.favorite,
          },
          queryParameters: {
            "session_id": id,
          },
        );
        return Right('updated successfully');
      } catch (error) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
