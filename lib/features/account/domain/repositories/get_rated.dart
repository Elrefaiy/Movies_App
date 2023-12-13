import 'package:dartz/dartz.dart';
import 'package:movies_application/core/errors/failures.dart';
import 'package:movies_application/features/account/domain/entities/rated.dart';

abstract class GetRatedRepo {
  Future<Either<Failure, Rated>> getRatedMovies(String sessionId);
}
