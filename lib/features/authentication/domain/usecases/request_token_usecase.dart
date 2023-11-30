import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/request_token.dart';
import '../repositories/request_token_repo.dart';

class RequestTokenUsecase extends UseCase<RequestToken, NoParams> {
  final RequestTokenRepo requestTokenRepo;

  RequestTokenUsecase({
    required this.requestTokenRepo,
  });
  @override
  Future<Either<Failure, RequestToken>> call(NoParams params) {
    return requestTokenRepo.createRequestToken();
  }
}
