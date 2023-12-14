import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/rated.dart';
import '../repositories/get_rated.dart';

class GetRatedUsecase extends UseCase<Rated, String> {
  final GetRatedRepo getRatedRepo;

  GetRatedUsecase({
    required this.getRatedRepo,
  });

  @override
  Future<Either<Failure, Rated>> call(String params) {
    return getRatedRepo.getRatedMovies(params);
  }
}
