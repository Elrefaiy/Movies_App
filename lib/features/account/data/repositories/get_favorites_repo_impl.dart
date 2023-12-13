import 'package:dartz/dartz.dart';
import 'package:movies_application/core/errors/failures.dart';
import 'package:movies_application/core/network/network_info.dart';
import 'package:movies_application/features/account/data/datasources/get_favorites_remote.dart';
import 'package:movies_application/features/account/data/models/favorite_model.dart';
import 'package:movies_application/features/account/domain/repositories/get_favorites.dart';

class GetFavoritesRepoImpl implements GetFavoritesRepo {
  final GetFavoritesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GetFavoritesRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, FavoriteModel>> getFavorites(
    String sessionId,
  ) async {
    if (await networkInfo.hasConnection) {
      try {
        var response = await remoteDataSource.getFavorites(
          sessionId: sessionId,
        );
        return Right(response);
      } catch (error) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
