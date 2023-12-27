import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/saved_movie.dart';
import '../repositories/get_rated.dart';

class GetRatedUsecase extends UseCase<SavedMovie, String> {
  final GetRatedRepo getRatedRepo;

  GetRatedUsecase({
    required this.getRatedRepo,
  });

  @override
  Future<Either<Failure, SavedMovie>> call(String params) {
    return getRatedRepo.getRatedMovies(params);
  }
}
