import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/request_token.dart';
import '../../domain/usecases/request_token_usecase.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final RequestTokenUsecase requestTokenUsecase;
  AuthenticationCubit({
    required this.requestTokenUsecase,
  }) : super(AuthenticationInitial());
  static AuthenticationCubit get(context) => BlocProvider.of(context);

  var pageController = PageController();
  int currentIndex = 0;

  void chageIndex(int index) {
    emit(AuthenticationInitial());
    currentIndex = index;
    emit(ChangeIndexState());
  }

  String requestToken = '';
  Future<void> createRequestToken() async {
    final response = await requestTokenUsecase(NoParams());
    response.fold(
      (fail) => emit(CreateRequestTokenError()),
      (requestToken) {
        this.requestToken = requestToken.requestToken;
        emit(CreateRequestTokenSuccess());
      },
    );
  }
}
