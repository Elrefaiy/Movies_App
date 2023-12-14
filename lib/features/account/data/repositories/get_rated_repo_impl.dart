import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/get_Rated_remote.dart';
import '../models/rated_model.dart';

import '../../domain/repositories/get_rated.dart';

class GetRatedRepoImpl implements GetRatedRepo {
  final GetRatedRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GetRatedRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, RatedModel>> getRatedMovies(
    String sessionId,
  ) async {
    if (await networkInfo.hasConnection) {
      try {
        var response = await remoteDataSource.getRated(
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
