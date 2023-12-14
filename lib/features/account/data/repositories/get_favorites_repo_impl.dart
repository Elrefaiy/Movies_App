import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/get_favorites.dart';
import '../datasources/get_favorites_remote.dart';
import '../models/favorite_model.dart';

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
