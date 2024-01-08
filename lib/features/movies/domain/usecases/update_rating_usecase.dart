import 'package:dartz/dartz.dart';
import 'package:movies_application/core/errors/failures.dart';
import 'package:movies_application/core/usecase/usecase.dart';
import 'package:movies_application/features/movies/domain/repositories/update_rating_repo.dart';

class UpdateRatingUseCase extends UseCase<String, RatingParams> {
  final UpdateRatingRepo updateRatingRepo;

  UpdateRatingUseCase({required this.updateRatingRepo});
  @override
  Future<Either<Failure, String>> call(RatingParams params) {
    return updateRatingRepo.updateRating(params);
  }
}
