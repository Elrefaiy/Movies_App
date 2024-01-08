import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/update_rating_repo.dart';

class UpdateRatingUseCase extends UseCase<String, RatingParams> {
  final UpdateRatingRepo updateRatingRepo;

  UpdateRatingUseCase({required this.updateRatingRepo});
  @override
  Future<Either<Failure, String>> call(RatingParams params) {
    return updateRatingRepo.updateRating(params);
  }
}
