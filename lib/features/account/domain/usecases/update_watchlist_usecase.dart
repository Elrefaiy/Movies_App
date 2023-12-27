import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/update_watchlist_repo.dart';

class UpdateWatchlistUsecase extends UseCase<String, WatchlistParams> {
  final UpdateWatchlistRepo updateWatchlistRepo;

  UpdateWatchlistUsecase({required this.updateWatchlistRepo});
  @override
  Future<Either<Failure, String>> call(WatchlistParams params) {
    return updateWatchlistRepo.updateWatchlist(params);
  }
}
