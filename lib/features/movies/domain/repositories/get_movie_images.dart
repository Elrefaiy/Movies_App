import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/image.dart';

abstract class GetMovieImagesRepo {
  Future<Either<Failure, Images>> getMovieImages({required int id});
}
