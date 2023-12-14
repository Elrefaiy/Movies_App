import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/favorite.dart';
import '../repositories/get_favorites.dart';

class GetFavoritesUsecase extends UseCase<Favorite, String> {
  final GetFavoritesRepo getFavoritesRepo;

  GetFavoritesUsecase({required this.getFavoritesRepo});
  @override
  Future<Either<Failure, Favorite>> call(String params) {
    return getFavoritesRepo.getFavorites(params);
  }
}
