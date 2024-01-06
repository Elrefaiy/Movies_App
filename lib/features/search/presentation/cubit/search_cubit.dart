import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/search_movie.dart';
import '../../domain/usecases/search_movie_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchMovieUsecase searchMovieUsecase;

  SearchCubit({required this.searchMovieUsecase}) : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  bool isEmpty = true;
  Future<void> SearchMovie({
    required String title,
  }) async {
    emit(SearchMovieLoading());
    final response = await searchMovieUsecase(title);

    response.fold(
      (failure) => emit(SearchMovieError()),
      (searchResult) {
        isEmpty = false;
        emit(SearchMovieSuccessfully(result: searchResult.results));
      },
    );
  }
}
