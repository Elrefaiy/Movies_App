import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/details.dart';

abstract class GetDetailsRepo {
  Future<Either<Failure, Details>> getAccountDetails(String id);
}
