import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/details.dart';
import '../repositories/get_details.dart';

class GetDetailsUsecase extends UseCase<Details, String> {
  final GetDetailsRepo getDetailsRepo;

  GetDetailsUsecase({
    required this.getDetailsRepo,
  });

  @override
  Future<Either<Failure, Details>> call(String params) {
    return getDetailsRepo.getAccountDetails(params);
  }
}
