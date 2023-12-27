import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/update_favorite.dart';

class UpdateFavoriteUsecase extends UseCase<String, FavoriteParams> {
  final UpdateFavoriteRepo updateFavoriteRepo;

  UpdateFavoriteUsecase({required this.updateFavoriteRepo});
  @override
  Future<Either<Failure, String>> call(FavoriteParams params) {
    return updateFavoriteRepo.updateFavorites(params);
  }
}
