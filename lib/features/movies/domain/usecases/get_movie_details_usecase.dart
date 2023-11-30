import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/movie_details.dart';
import '../repositories/get_movie_details.dart';

class GetMovieDetailsUsecase extends UseCase<MovieDetails, int> {
  GetMovieDetailsRepo getMovieDetailsRepo;
  GetMovieDetailsUsecase({
    required this.getMovieDetailsRepo,
  });

  @override
  Future<Either<Failure, MovieDetails>> call(int params) {
    return getMovieDetailsRepo.getMovieDetails(id: params);
  }
}
