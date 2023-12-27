import 'package:dartz/dartz.dart';
import '../entities/saved_movie.dart';
import '../repositories/get_watchlist_repo.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';

class GetWatchlistUsecase extends UseCase<SavedMovie, String> {
  final GetWatchlistRepo getWatchlistRepo;

  GetWatchlistUsecase({required this.getWatchlistRepo});
  @override
  Future<Either<Failure, SavedMovie>> call(String params) {
    return getWatchlistRepo.getWatchlist(params);
  }
}
