import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/saved_movie.dart';
import '../repositories/get_favorites.dart';

class GetFavoritesUsecase extends UseCase<SavedMovie, String> {
  final GetFavoritesRepo getFavoritesRepo;

  GetFavoritesUsecase({required this.getFavoritesRepo});
  @override
  Future<Either<Failure, SavedMovie>> call(String params) {
    return getFavoritesRepo.getFavorites(params);
  }
}
