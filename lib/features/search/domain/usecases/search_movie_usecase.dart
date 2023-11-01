import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/search_movie.dart';
import '../repositories/search_movie_repo.dart';

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
