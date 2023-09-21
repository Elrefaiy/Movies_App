import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/video.dart';
import '../../domain/usecases/get_movie_videos.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/entities/movie_details.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  GetMovieDetailsUsecase getMovieDetailsUsecase;
  GetMovieVideosUsecase getMovieVideosUsecase;
  MoviesCubit({
    required this.getMovieDetailsUsecase,
    required this.getMovieVideosUsecase,
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
        getMoviesVideos(id: id);
        emit(GetMovieDetailsSuccessfully());
      },
    );
  }

  List<Results> videos = [];
  late Results trailer;
  Future<void> getMoviesVideos({
    required int id,
  }) async {
    emit(GetMovieVideosLoading());
    videos = [];
    final response = await getMovieVideosUsecase(id);
    response.fold(
      (failure) => emit(GetMovieVideosError()),
      (moviesVideos) {
        videos = moviesVideos.results;
        videos.forEach(
          (element) {
            if (element.type == 'Trailer') trailer = element;
          },
        );
        emit(GetMovieVideosSuccessfully());
      },
    );
  }
}
