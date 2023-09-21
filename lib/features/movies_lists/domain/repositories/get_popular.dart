import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movies_list.dart';

abstract class GetPopularRepo {
  Future<Either<Failure, MoviesList>> getPopular(int pageNumber);
}
