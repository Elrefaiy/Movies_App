import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class DeleteSessionRepo {
  Future<Either<Failure, String>> deleteSession(String sessionId);
}
