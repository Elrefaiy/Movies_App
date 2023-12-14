import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/account_states.dart';

abstract class GetAccountStatesRepo {
  Future<Either<Failure, AccountStates>> getAccountStates(int movieId);
}
