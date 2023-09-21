import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/movie_videos_remote.dart';
import '../../domain/entities/video.dart';
import '../../domain/repositories/get_movie_videos_repo.dart';

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
