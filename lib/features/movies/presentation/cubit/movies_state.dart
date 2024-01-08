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

class GetImagesLoading extends MoviesState {}

class GetImagesSuccessfully extends MoviesState {}

class GetImagesError extends MoviesState {}

class GetAccountStatesLoading extends MoviesState {}

class GetAccountStatesSuccessfully extends MoviesState {}

class GetAccountStatesError extends MoviesState {}

class UpdateRatingSuccessfully extends MoviesState {}

class UpdateRatingError extends MoviesState {}
