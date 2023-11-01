import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/search_movie.dart';

abstract class SearchMovieRepo {
  Future<Either<Failure, SearchMovie>> searchMovie({
    required String title,
  });
}
