import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/session.dart';
import '../repositories/create_session_repo.dart';

class CreateSessionUsecase extends UseCase<Session, String> {
  final CreateSessionRepo createSessionRepo;

  CreateSessionUsecase({required this.createSessionRepo});
  @override
  Future<Either<Failure, Session>> call(String params) {
    return createSessionRepo.createSession(requestToken: params);
  }
}
