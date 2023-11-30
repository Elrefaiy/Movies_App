import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/credit.dart';
import '../../domain/entities/image.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/video.dart';
import '../../domain/usecases/get_credit_usecase.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_movie_images_usecase.dart';
import '../../domain/usecases/get_movie_videos.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  GetMovieDetailsUsecase getMovieDetailsUsecase;
  GetMovieVideosUsecase getMovieVideosUsecase;
  GetCreditUsecase getCreditUsecase;
  GetMovieImagesUsecase getMovieImagesUsecase;

  MoviesCubit({
    required this.getMovieDetailsUsecase,
    required this.getMovieVideosUsecase,
    required this.getCreditUsecase,
    required this.getMovieImagesUsecase,
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
        getCredit(id: id);
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

  List<Cast> casts = [];
  List<Crew> crew = [];
  Future<void> getCredit({required int id}) async {
    emit(GetCreditLoading());
    final response = await getCreditUsecase(id);
    response.fold(
      (failure) => emit(GetCreditError()),
      (credit) {
        casts = credit.casts;
        crew = credit.crew;
        emit(GetCreditSuccessfully());
      },
    );
  }

  List<ImageDetails> logos = [];
  List<ImageDetails> posters = [];
  List<ImageDetails> backdrops = [];
  Future<void> getImages({required int id}) async {
    emit(GetImagesLoading());
    final response = await getMovieImagesUsecase.call(id);
    response.fold(
      (failure) => emit(GetImagesError()),
      (images) {
        logos = images.logos;
        posters = images.posters;
        backdrops = images.backdrops;
        emit(GetImagesSuccessfully());
      },
    );
  }
}
