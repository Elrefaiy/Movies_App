import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/credit.dart';

abstract class GetCreditRepo {
  Future<Either<Failure, Credit>> GetCredit({required int movieId});
}
