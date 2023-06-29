import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movies_lists_state.dart';

class MoviesListsCubit extends Cubit<MoviesListsState> {
  MoviesListsCubit() : super(MoviesListsInitial());
  static MoviesListsCubit get(context) => BlocProvider.of(context);

  int currentListIndex = 0;
  void changeCurrentListIndex(index) {
    emit(MoviesListsInitial());
    currentListIndex = index;
    emit(ChangeCurrentListIndex());
  }
}
