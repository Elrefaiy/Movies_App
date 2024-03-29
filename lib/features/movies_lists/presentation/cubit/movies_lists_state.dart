part of 'movies_lists_cubit.dart';

abstract class MoviesListsState extends Equatable {
  const MoviesListsState();

  @override
  List<Object> get props => [];
}

class MoviesListsInitial extends MoviesListsState {}

class ChangeCurrentListIndex extends MoviesListsState {}

class LoadingMovieList extends MoviesListsState {}

class MovieListLoadingError extends MoviesListsState {}

class NowPlayingLoadedSuccessfully extends MoviesListsState {}

class PopularLoadedSuccessfully extends MoviesListsState {}

class TopRatedLoadedSuccessfully extends MoviesListsState {}

class UpComingLoadedSuccessfully extends MoviesListsState {}
