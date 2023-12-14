import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/favorite.dart';

abstract class GetFavoritesRepo {
  Future<Either<Failure, Favorite>> getFavorites(
    String sessionId,
  );
}
