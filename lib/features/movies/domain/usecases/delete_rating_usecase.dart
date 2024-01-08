import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/delete_rating_repo.dart';

class DeleteRatingUseCase extends UseCase<String, int> {
  final DeleteRatingRepo deleteRatingRepo;

  DeleteRatingUseCase({required this.deleteRatingRepo});
  @override
  Future<Either<Failure, String>> call(int params) {
    return deleteRatingRepo.deleteRating(params);
  }
}
