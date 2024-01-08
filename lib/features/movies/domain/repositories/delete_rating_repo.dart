import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class DeleteRatingRepo {
  Future<Either<Failure, String>> deleteRating(int id);
}
