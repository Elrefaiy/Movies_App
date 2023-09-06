import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/video.dart';
import '../repositories/get_movie_videos_repo.dart';

class GetMovieVideosUsecase extends UseCase<Videos, int> {
  final GetMovieVideosRepo getMovieVideosRepo;
  GetMovieVideosUsecase({
    required this.getMovieVideosRepo,
  });

  @override
  Future<Either<Failure, Videos>> call(int params) {
    return getMovieVideosRepo.getMovieVideos(id: params);
  }
}
