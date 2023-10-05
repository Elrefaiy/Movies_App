import 'package:dartz/dartz.dart';
import 'package:movies_application/core/errors/failures.dart';
import 'package:movies_application/core/usecase/usecase.dart';
import 'package:movies_application/features/search/domain/entities/search_movie.dart';
import 'package:movies_application/features/search/domain/repositories/search_movie_repo.dart';

class SearchMovieUsecase extends UseCase<SearchMovie, String> {
  final SearchMovieRepo searchMovieRepo;
  SearchMovieUsecase({
    required this.searchMovieRepo,
  });
  @override
  Future<Either<Failure, SearchMovie>> call(String params) {
    return searchMovieRepo.searchMovie(title: params);
  }
}
