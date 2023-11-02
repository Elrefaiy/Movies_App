import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/movies_list.dart';
import '../../domain/usecases/get_now_playing_usecase.dart';
import '../../domain/usecases/get_popular_usecase.dart';
import '../../domain/usecases/get_top_rated_usecase.dart';
import '../../domain/usecases/get_upcoming_usecase.dart';

import '../../../../core/errors/failures.dart';

part 'movies_lists_state.dart';

class MoviesListsCubit extends Cubit<MoviesListsState> {
  final GetNowPlayingUsecase getNowPlayingUsecase;
  final GetPopularUsecase getPopularUsecase;
  final GetTopRatedUsecase getTopRatedUsecase;
  final GetUpcomingUsecase getUpcomingUsecase;

  MoviesListsCubit({
    required this.getNowPlayingUsecase,
    required this.getPopularUsecase,
    required this.getTopRatedUsecase,
    required this.getUpcomingUsecase,
  }) : super(MoviesListsInitial());

  static MoviesListsCubit get(context) => BlocProvider.of(context);

  //screen position
  double top = -280;
  double left = -755;

  int currentListIndex = 0;
  void changeCurrentListIndex(index) {
    emit(MoviesListsInitial());
    top = -280;
    left = -755;
    currentListIndex = index;
    emit(ChangeCurrentListIndex());
  }

  List<Result> nowPlayingMovies = [];
  int nowPlayingLastPageLoaded = 1;
  Future<void> getNowPlaying() async {
    emit(LoadingMovieList());
    Either<Failure, MoviesList> response =
        await getNowPlayingUsecase(nowPlayingLastPageLoaded);
    emit(
      response.fold(
        (failure) => MovieListLoadingError(),
        (moviesList) {
          nowPlayingMovies.addAll(moviesList.results);
          if (nowPlayingLastPageLoaded < moviesList.totalPages)
            nowPlayingLastPageLoaded++;
          return NowPlayingLoadedSuccessfully();
        },
      ),
    );
  }

  List<Result> popularMovies = [];
  int popularLastPageLoaded = 1;
  Future<void> getPopular() async {
    emit(LoadingMovieList());
    Either<Failure, MoviesList> response =
        await getPopularUsecase(popularLastPageLoaded);
    emit(
      response.fold(
        (failure) => MovieListLoadingError(),
        (moviesList) {
          popularMovies.addAll(moviesList.results);
          if (popularLastPageLoaded < moviesList.totalPages)
            popularLastPageLoaded++;
          return PopularLoadedSuccessfully();
        },
      ),
    );
  }

  List<Result> topRatedMovies = [];
  int topRatedLastPageLoaded = 1;
  Future<void> getTopRated() async {
    emit(LoadingMovieList());
    Either<Failure, MoviesList> response =
        await getTopRatedUsecase(topRatedLastPageLoaded);
    emit(
      response.fold(
        (failure) => MovieListLoadingError(),
        (moviesList) {
          topRatedMovies.addAll(moviesList.results);
          if (topRatedLastPageLoaded < moviesList.totalPages)
            topRatedLastPageLoaded++;
          return TopRatedLoadedSuccessfully();
        },
      ),
    );
  }

  List<Result> upcomingMovies = [];
  int upcomingLastPageLoaded = 1;
  Future<void> getUpComing() async {
    emit(LoadingMovieList());
    Either<Failure, MoviesList> response =
        await getUpcomingUsecase(upcomingLastPageLoaded);
    emit(
      response.fold(
        (failure) => MovieListLoadingError(),
        (moviesList) {
          upcomingMovies.addAll(moviesList.results);
          if (upcomingLastPageLoaded < moviesList.totalPages)
            upcomingLastPageLoaded++;
          return UpComingLoadedSuccessfully();
        },
      ),
    );
  }

  // String _mapFailureToMsg(Failure failure) {
  //   switch (failure.runtimeType) {
  //     case ServerFailure:
  //       return AppStrings.serverFailure;
  //     case CacheFailure:
  //       return AppStrings.cacheFailure;

  //     default:
  //       return AppStrings.unexpectedError;
  //   }
}
