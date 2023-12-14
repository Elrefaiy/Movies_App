import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/get_account_states.dart';
import '../datasources/get_account_states_remote.dart';
import '../models/account_states_model.dart';

class GetAccountStatesRepoImpl implements GetAccountStatesRepo {
  final NetworkInfo networkInfo;
  final GetAccountStatesRemoteDS remoteDataSource;

  GetAccountStatesRepoImpl({
    required this.networkInfo,
    required this.remoteDataSource,
  });
  @override
  Future<Either<Failure, AccountStatesModel>> getAccountStates(
      int movieId) async {
    if (await networkInfo.hasConnection) {
      try {
        var response = await remoteDataSource.getAccountStates(movieId);
        return Right(response);
      } catch (error) {
        print(error.toString());
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
