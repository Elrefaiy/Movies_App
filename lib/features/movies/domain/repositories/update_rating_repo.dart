import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';

abstract class UpdateRatingRepo {
  Future<Either<Failure, String>> updateRating(RatingParams params);
}
