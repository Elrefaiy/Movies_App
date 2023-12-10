import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/delete_session.dart';

class DeleteSessionUsecase extends UseCase<String, String> {
  final DeleteSessionRepo deleteSessionRepo;

  DeleteSessionUsecase({required this.deleteSessionRepo});

  @override
  Future<Either<Failure, String>> call(String params) {
    return deleteSessionRepo.deleteSession(params);
  }
}
