import 'package:dartz/dartz.dart';
import '../entities/saved_movie.dart';

import '../../../../core/errors/failures.dart';

abstract class GetFavoritesRepo {
  Future<Either<Failure, SavedMovie>> getFavorites(
    String sessionId,
  );
}
