import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/saved_movie.dart';

abstract class GetFavoritesRepo {
  Future<Either<Failure, SavedMovie>> getFavorites(
    String sessionId,
  );
}
