import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/search_movie_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/search_movie_repo.dart';
import '../datasources/search_movie_remote.dart';

class SearchMovieRepoImpl implements SearchMovieRepo {
  final SearchMovieRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  SearchMovieRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, SearchMovieModel>> searchMovie({
    required String title,
  }) async {
    if (await networkInfo.hasConnection) {
      try {
        final response = await remoteDataSource.searchMovie(title: title);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      throw NoInternetConnectionException();
    }
  }
}
