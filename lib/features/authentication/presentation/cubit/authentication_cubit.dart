import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
  static AuthenticationCubit get(context) => BlocProvider.of(context);

  var pageController = PageController();
  int currentIndex = 0;

  void chageIndex(int index) {
    emit(AuthenticationInitial());
    currentIndex = index;
    emit(ChangeIndexState());
  }
}
