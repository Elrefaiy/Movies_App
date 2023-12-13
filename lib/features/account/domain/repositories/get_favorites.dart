import 'package:dartz/dartz.dart';
import 'package:movies_application/core/errors/failures.dart';
import 'package:movies_application/features/account/domain/entities/favorite.dart';

abstract class GetFavoritesRepo {
  Future<Either<Failure, Favorite>> getFavorites(
    String sessionId,
  );
}
