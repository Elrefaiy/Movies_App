part of 'movies_lists_cubit.dart';

abstract class MoviesListsState extends Equatable {
  const MoviesListsState();

  @override
  List<Object> get props => [];
}

class MoviesListsInitial extends MoviesListsState {}

class ChangeCurrentListIndex extends MoviesListsState {}

class LoadingMovieList extends MoviesListsState {}

class NowPlayingLoadingError extends MoviesListsState {}

class NowPlayingLoadedSuccessfully extends MoviesListsState {}

class PopularLoadingError extends MoviesListsState {}

class PopularLoadedSuccessfully extends MoviesListsState {}

class TopRatedLoadingError extends MoviesListsState {}

class TopRatedLoadedSuccessfully extends MoviesListsState {}

class UpComingLoadingError extends MoviesListsState {}

class UpComingLoadedSuccessfully extends MoviesListsState {}
