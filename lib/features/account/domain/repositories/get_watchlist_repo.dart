import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/saved_movie.dart';

abstract class GetWatchlistRepo {
  Future<Either<Failure, SavedMovie>> getWatchlist(
    String sessionId,
  );
}
