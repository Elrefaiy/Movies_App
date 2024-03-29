import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/saved_movie.dart';

abstract class GetRatedRepo {
  Future<Either<Failure, SavedMovie>> getRatedMovies(String sessionId);
}
