part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchMovieLoading extends SearchState {}

class SearchMovieSuccessfully extends SearchState {
  final List<SearchResult> result;
  SearchMovieSuccessfully({
    required this.result,
  });
  List<Object> get props => [result];
}

class SearchMovieError extends SearchState {}
