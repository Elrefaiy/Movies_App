import 'package:dartz/dartz.dart';
import 'package:movies_application/core/errors/exceptions.dart';
import 'package:movies_application/core/errors/failures.dart';
import 'package:movies_application/core/network/network_info.dart';
import 'package:movies_application/features/movies/data/datasources/movie_details_remote.dart';
import 'package:movies_application/features/movies/domain/entities/movie_details.dart';
import 'package:movies_application/features/movies/domain/repositories/get_movie_details.dart';

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
