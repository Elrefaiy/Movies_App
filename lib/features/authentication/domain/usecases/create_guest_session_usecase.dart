import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/guest_session.dart';
import '../repositories/create_guest_session_repo.dart';

class CreateGuestSessionUsecase extends UseCase<GuestSession, NoParams> {
  final CreateGuestSessionRepo createGuestSessionRepo;

  CreateGuestSessionUsecase({required this.createGuestSessionRepo});
  @override
  Future<Either<Failure, GuestSession>> call(NoParams params) {
    return createGuestSessionRepo.createGuestSession();
  }
}
