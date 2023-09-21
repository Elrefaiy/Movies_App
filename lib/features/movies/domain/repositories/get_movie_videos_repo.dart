import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/video.dart';

abstract class GetMovieVideosRepo {
  Future<Either<Failure, Videos>> getMovieVideos({
    required int id,
  });
}
