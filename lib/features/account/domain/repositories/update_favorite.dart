import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';

abstract class UpdateFavoriteRepo {
  Future<Either<Failure, String>> updateFavorites(FavoriteParams params);
}
