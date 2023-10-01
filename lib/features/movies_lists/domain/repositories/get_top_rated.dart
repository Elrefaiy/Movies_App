import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movies_list.dart';

abstract class GetTopRatedRepo {
  Future<Either<Failure, MoviesList>> getTopRated(int pageNumber);
}
