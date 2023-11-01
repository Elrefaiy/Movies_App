import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/get_movie_images.dart';
import '../datasources/movie_images_remote.dart';
import '../models/image_model.dart';

class GetMovieImagesRepoImpl implements GetMovieImagesRepo {
  final GetMovieImagesRemoteDataSorce remoteDataSource;
  final NetworkInfo networkInfo;

  GetMovieImagesRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ImagesModel>> getMovieImages({
    required int id,
  }) async {
    if (await networkInfo.hasConnection) {
      try {
        final response = await remoteDataSource.getImageRemote(id: id);
        return Right(response);
      } catch (error) {
        return Left(ServerFailure());
      }
    } else {
      throw (NoInternetConnectionException());
    }
  }
}
