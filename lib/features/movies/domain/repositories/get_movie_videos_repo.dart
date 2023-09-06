import 'package:dartz/dartz.dart';
import 'package:movies_application/core/errors/failures.dart';
import 'package:movies_application/features/movies/domain/entities/video.dart';

abstract class GetMovieVideosRepo {
  Future<Either<Failure, Videos>> getMovieVideos({
    required int id,
  });
}
