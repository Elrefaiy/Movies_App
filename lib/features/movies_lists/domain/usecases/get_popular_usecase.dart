import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/movies_list.dart';
import '../repositories/get_popular.dart';

class GetPopularUsecase extends UseCase<MoviesList, int> {
  final GetPopularRepo getPopularRepo;
  GetPopularUsecase({required this.getPopularRepo});

  @override
  Future<Either<Failure, MoviesList>> call(int params) {
    return getPopularRepo.getPopular(params);
  }
}
