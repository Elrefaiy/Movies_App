import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/movies_list.dart';
import '../repositories/get_now_playing.dart';

class GetNowPlayingUsecase extends UseCase<MoviesList, int> {
  final GetNowPlayingRepo getNowPlayingRepo;
  GetNowPlayingUsecase({required this.getNowPlayingRepo});

  @override
  Future<Either<Failure, MoviesList>> call(int params) {
    return getNowPlayingRepo.getNowPlaying(params);
  }
}
