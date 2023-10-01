import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/credit.dart';
import '../repositories/get_credit_repo.dart';

class GetCreditUsecase extends UseCase<Credit, int> {
  final GetCreditRepo getCreditRepo;
  GetCreditUsecase({
    required this.getCreditRepo,
  });

  @override
  Future<Either<Failure, Credit>> call(int params) {
    return getCreditRepo.GetCredit(movieId: params);
  }
}
