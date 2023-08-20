import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/movies_list.dart';

import '../../domain/repositories/get_top_rated.dart';
import '../datasources/top_rated_remote.dart';

class GetTopRatedRepoImpl implements GetTopRatedRepo {
  final NetworkInfo networkInfo;
  final TopRatedRemoteDataSource remoteDataSource;
  GetTopRatedRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, MoviesList>> getTopRated(int pageNumber) async {
    if (await networkInfo.hasConnection) {
      try {
        final response = await remoteDataSource.getTopRatedRemote(pageNumber);
        return Right(response);
      } catch (error) {
        return Left(ServerFailure());
      }
    } else {
      throw NoInternetConnectionException();
    }
  }
}
