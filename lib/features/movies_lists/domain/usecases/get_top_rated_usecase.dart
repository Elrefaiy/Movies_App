import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/movies_list.dart';
import '../repositories/get_top_rated.dart';

class GetTopRatedUsecase extends UseCase<MoviesList, int> {
  final GetTopRatedRepo getTopRatedRepo;
  GetTopRatedUsecase({required this.getTopRatedRepo});

  @override
  Future<Either<Failure, MoviesList>> call(int params) {
    return getTopRatedRepo.getTopRated(params);
  }
}
