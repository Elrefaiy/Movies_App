part of 'movies_cubit.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class GetMovieDetailsLoading extends MoviesState {}

class GetMovieDetailsSuccessfully extends MoviesState {}

class GetMovieDetailsError extends MoviesState {}
