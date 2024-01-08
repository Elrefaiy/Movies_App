import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/get_watchlist_repo.dart';
import '../datasources/get_watchlist_remote.dart';
import '../models/saved_movie_model.dart';

class GetWatchlistRepoImpl implements GetWatchlistRepo {
  final GetWatchlistRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GetWatchlistRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, SavedMovieModel>> getWatchlist(
    String sessionId,
  ) async {
    if (await networkInfo.hasConnection) {
      try {
        var response = await remoteDataSource.getWatchlist(
          sessionId: sessionId,
        );
        return Right(response);
      } catch (error) {
        print(error.toString());
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
