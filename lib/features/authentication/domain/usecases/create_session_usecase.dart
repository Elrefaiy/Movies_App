import 'package:dartz/dartz.dart';
import 'package:movies_application/core/errors/failures.dart';
import 'package:movies_application/core/usecase/usecase.dart';
import 'package:movies_application/features/authentication/domain/entities/session.dart';
import 'package:movies_application/features/authentication/domain/repositories/create_session_repo.dart';

class CreateSessionUsecase extends UseCase<Session, String> {
  final CreateSessionRepo createSessionRepo;

  CreateSessionUsecase({required this.createSessionRepo});
  @override
  Future<Either<Failure, Session>> call(String params) {
    return createSessionRepo.createSession(requestToken: params);
  }
}
