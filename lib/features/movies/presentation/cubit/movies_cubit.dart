import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/core/errors/failures.dart';
import 'package:movies_application/features/movies/domain/usecases/get_movie_details_usecase.dart';

import '../../domain/entities/movie_details.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  GetMovieDetailsUsecase getMovieDetailsUsecase;
  MoviesCubit({
    required this.getMovieDetailsUsecase,
  }) : super(MoviesInitial());

  static MoviesCubit get(context) => BlocProvider.of(context);

  late MovieDetails movie;
  Future<void> getMovieDetails({
    required int id,
  }) async {
    emit(GetMovieDetailsLoading());
    final response = await getMovieDetailsUsecase(id);
    response.fold(
      (failure) => emit(GetMovieDetailsError()),
      (movieDetails) {
        movie = movieDetails;
        emit(GetMovieDetailsSuccessfully());
      },
    );
  }
}
