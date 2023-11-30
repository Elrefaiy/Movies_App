import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/image.dart';
import '../repositories/get_movie_images.dart';

class GetMovieImagesUsecase extends UseCase<Images, int> {
  final GetMovieImagesRepo getMovieImagesRepo;
  GetMovieImagesUsecase({required this.getMovieImagesRepo});

  @override
  Future<Either<Failure, Images>> call(int params) {
    return getMovieImagesRepo.getMovieImages(id: params);
  }
}
