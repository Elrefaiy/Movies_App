import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/repositories/get_movie_details.dart';
import '../datasources/movie_details_remote.dart';

class GetMovieDetailsRepoImpl implements GetMovieDetailsRepo {
  final NetworkInfo networkInfo;
  final MovieDetailsRemoteDataSource remoteDataSource;

  GetMovieDetailsRepoImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails({
    required int id,
  }) async {
    if (await networkInfo.hasConnection) {
      try {
        final response = await remoteDataSource.getMovieDetailsRemote(id: id);
        return Right(response);
      } catch (error) {
        print(error.toString());
        return Left(ServerFailure());
      }
    } else {
      throw NoInternetConnectionException();
    }
  }
}
