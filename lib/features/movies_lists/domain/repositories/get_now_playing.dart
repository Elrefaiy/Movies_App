import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/movies_list.dart';

abstract class GetNowPlayingRepo {
  Future<Either<Failure, MoviesList>> getNowPlaying(int pageNumber);
}
