part of 'movies_lists_cubit.dart';

abstract class MoviesListsState extends Equatable {
  const MoviesListsState();

  @override
  List<Object> get props => [];
}

class MoviesListsInitial extends MoviesListsState {}

class ChangeCurrentListIndex extends MoviesListsState {}
