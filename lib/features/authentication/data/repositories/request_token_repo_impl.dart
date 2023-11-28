import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/request_token_repo.dart';
import '../datasources/request_token_remote.dart';
import '../models/request_token_model.dart';

class RequestTokenRepoImpl implements RequestTokenRepo {
  final RequestTokenRemote requestTokenRemote;
  final NetworkInfo networkInfo;

  RequestTokenRepoImpl({
    required this.requestTokenRemote,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, RequestTokenModel>> createRequestToken() async {
    if (await networkInfo.hasConnection) {
      try {
        final response = await requestTokenRemote.createRequestTokenRemote();
        return Right(response);
      } catch (error) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
