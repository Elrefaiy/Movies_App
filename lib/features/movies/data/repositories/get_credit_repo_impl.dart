import 'package:dartz/dartz.dart';
import '../models/credit_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/get_credit_repo.dart';
import '../datasources/credit_remote.dart';

class GetCreditRepoImpl implements GetCreditRepo {
  final NetworkInfo networkInfo;
  final CreditRemoteDataSource remoteDataSource;

  GetCreditRepoImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, CreditModel>> GetCredit({required int movieId}) async {
    if (await networkInfo.hasConnection) {
      try {
        final response = await remoteDataSource.getCreditRemote(id: movieId);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      throw NoInternetConnectionException();
    }
  }
}
