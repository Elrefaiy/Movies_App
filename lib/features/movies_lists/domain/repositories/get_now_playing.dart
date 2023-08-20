import 'package:dartz/dartz.dart';
import 'package:movies_application/core/errors/failures.dart';
import 'package:movies_application/features/movies_lists/domain/entities/movies_list.dart';

abstract class GetNowPlayingRepo {
  Future<Either<Failure, MoviesList>> getNowPlaying(int pageNumber);
}
