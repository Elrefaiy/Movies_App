import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/upcoming_remote.dart';
import '../../domain/entities/movies_list.dart';
import '../../domain/repositories/get_upcoming.dart';

class GetUpcomingRepoImpl implements GetUpcomingRepo {
  final NetworkInfo networkInfo;
  final UpcomingRemoteDataSource remoteDataSource;
  GetUpcomingRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, MoviesList>> getUpcoming(int pageNumber) async {
    if (await networkInfo.hasConnection) {
      try {
        final response = await remoteDataSource.getUpcomingRemote(pageNumber);
        return Right(response);
      } catch (error) {
        return Left(ServerFailure());
      }
    } else {
      throw NoInternetConnectionException();
    }
  }
}
