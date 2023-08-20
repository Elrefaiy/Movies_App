import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/movies_list.dart';
import '../../domain/repositories/get_now_playing.dart';
import '../datasources/now_playing_remote.dart';

class GetNowPlayingRepoImpl implements GetNowPlayingRepo {
  final NetworkInfo networkInfo;
  final NowPlayingRemoteDataSource remoteDataSource;
  GetNowPlayingRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, MoviesList>> getNowPlaying(int pageNumber) async {
    if (await networkInfo.hasConnection) {
      try {
        final response = await remoteDataSource.getNowPlayingRemote(pageNumber);
        return Right(response);
      } catch (error) {
        return Left(ServerFailure());
      }
    } else {
      throw NoInternetConnectionException();
    }
  }
}
