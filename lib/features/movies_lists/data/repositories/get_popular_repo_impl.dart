import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/movies_list.dart';
import '../../domain/repositories/get_popular.dart';
import '../datasources/popular_remote.dart';

class GetPopularRepoImpl implements GetPopularRepo {
  final NetworkInfo networkInfo;
  final PopularRemoteDataSource remoteDataSource;
  GetPopularRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, MoviesList>> getPopular(int pageNumber) async {
    if (await networkInfo.hasConnection) {
      try {
        final response = await remoteDataSource.getPopularRemote(pageNumber);
        return Right(response);
      } catch (error) {
        return Left(ServerFailure());
      }
    } else {
      // throw NoInternetConnectionException();
      return Left(ServerFailure());
    }
  }
}
