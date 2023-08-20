import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/movies_list.dart';

import '../repositories/get_upcoming.dart';

class GetUpcomingUsecase extends UseCase<MoviesList, int> {
  final GetUpcomingRepo getUpcomingRepo;
  GetUpcomingUsecase({required this.getUpcomingRepo});

  @override
  Future<Either<Failure, MoviesList>> call(int params) {
    return getUpcomingRepo.getUpcoming(params);
  }
}
