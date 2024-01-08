import 'package:dartz/dartz.dart';
import 'package:movies_application/core/usecase/usecase.dart';

import '../../../../core/errors/failures.dart';

abstract class UpdateRatingRepo {
  Future<Either<Failure, String>> updateRating(RatingParams params);
}
