import 'package:dartz/dartz.dart';
import 'package:movies_application/core/errors/failures.dart';
import 'package:movies_application/core/usecase/usecase.dart';
import 'package:movies_application/features/account/domain/entities/favorite.dart';
import 'package:movies_application/features/account/domain/repositories/get_favorites.dart';

class GetFavoritesUsecase extends UseCase<Favorite, String> {
  final GetFavoritesRepo getFavoritesRepo;

  GetFavoritesUsecase({required this.getFavoritesRepo});
  @override
  Future<Either<Failure, Favorite>> call(String params) {
    return getFavoritesRepo.getFavorites(params);
  }
}
