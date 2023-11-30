import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/session.dart';

abstract class CreateSessionRepo {
  Future<Either<Failure, Session>> createSession({
    required String requestToken,
  });
}
