import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/account_states.dart';
import '../repositories/get_account_states.dart';

class GetAccountStatesUsecase extends UseCase<AccountStates, int> {
  final GetAccountStatesRepo accountStatesRepo;

  GetAccountStatesUsecase({
    required this.accountStatesRepo,
  });

  @override
  Future<Either<Failure, AccountStates>> call(int params) {
    return accountStatesRepo.getAccountStates(params);
  }
}
