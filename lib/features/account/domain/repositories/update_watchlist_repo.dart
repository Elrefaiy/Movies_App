import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';

abstract class UpdateWatchlistRepo {
  Future<Either<Failure, String>> updateWatchlist(WatchlistParams params);
}
