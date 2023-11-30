import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/guest_session.dart';

abstract class CreateGuestSessionRepo {
  Future<Either<Failure, GuestSession>> createGuestSession();
}
