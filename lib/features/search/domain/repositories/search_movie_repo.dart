import 'package:dartz/dartz.dart';
import 'package:movies_application/core/errors/failures.dart';
import 'package:movies_application/features/search/domain/entities/search_movie.dart';

abstract class SearchMovieRepo {
  Future<Either<Failure, SearchMovie>> searchMovie({
    required String title,
  });
}
