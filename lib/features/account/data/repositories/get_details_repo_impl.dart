import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/get_details.dart';
import '../datasources/get_details_remote.dart';
import '../models/details_model.dart';

class GetDetailsRepoImpl implements GetDetailsRepo {
  final NetworkInfo networkInfo;
  final GetDetailsRemoteDataSource remoteDataSource;

  GetDetailsRepoImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, DetailsModel>> getAccountDetails(
      String sessionId) async {
    if (await networkInfo.hasConnection) {
      try {
        var response = await remoteDataSource.getAccountDetails(
          sessionId: sessionId,
        );
        return Right(response);
      } catch (error) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
