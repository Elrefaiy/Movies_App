import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/request_token.dart';

abstract class RequestTokenRepo {
  Future<Either<Failure, RequestToken>> createRequestToken();
}
