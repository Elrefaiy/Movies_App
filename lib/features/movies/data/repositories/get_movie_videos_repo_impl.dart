import 'package:dartz/dartz.dart';
import 'package:movies_application/core/errors/exceptions.dart';
import 'package:movies_application/core/errors/failures.dart';
import 'package:movies_application/core/network/network_info.dart';
import 'package:movies_application/features/movies/data/datasources/movie_videos_remote.dart';
import 'package:movies_application/features/movies/domain/entities/video.dart';
import 'package:movies_application/features/movies/domain/repositories/get_movie_videos_repo.dart';

class GetMovieVideosRepoImpl implements GetMovieVideosRepo {
  final NetworkInfo networkInfo;
  final MovieVideosRemoteDataSource remoteDataSource;

  GetMovieVideosRepoImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Videos>> getMovieVideos({
    required int id,
  }) async {
    if (await networkInfo.hasConnection) {
      try {
        final response = await remoteDataSource.getVideosRemote(id: id);
        return Right(response);
      } catch (error) {
        return Left(ServerFailure());
      }
    } else {
      throw NoInternetConnectionException();
    }
  }
}
