import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movies_list.dart';

abstract class GetUpcomingRepo {
  Future<Either<Failure, MoviesList>> getUpcoming(int pageNumber);
}
