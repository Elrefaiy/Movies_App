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

class GetMovieVideosLoading extends MoviesState {}

class GetMovieVideosSuccessfully extends MoviesState {}

class GetMovieVideosError extends MoviesState {}

class GetCreditLoading extends MoviesState {}

class GetCreditSuccessfully extends MoviesState {}

class GetCreditError extends MoviesState {}
