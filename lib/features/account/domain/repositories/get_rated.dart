import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/rated.dart';

abstract class GetRatedRepo {
  Future<Either<Failure, Rated>> getRatedMovies(String sessionId);
}
