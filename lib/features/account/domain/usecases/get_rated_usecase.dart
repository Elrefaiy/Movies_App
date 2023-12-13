import 'package:dartz/dartz.dart';
import 'package:movies_application/core/errors/failures.dart';
import 'package:movies_application/core/usecase/usecase.dart';
import 'package:movies_application/features/account/domain/entities/rated.dart';
import 'package:movies_application/features/account/domain/repositories/get_rated.dart';

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
