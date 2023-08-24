import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/movie_details.dart';

abstract class GetMovieDetailsRepo {
  Future<Either<Failure, MovieDetails>> getMovieDetails({required int id});
}
