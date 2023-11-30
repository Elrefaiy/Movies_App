import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/create_guest_session_usecase.dart';
import '../../domain/usecases/create_session_usecase.dart';
import '../../domain/usecases/request_token_usecase.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final RequestTokenUsecase requestTokenUsecase;
  final CreateSessionUsecase createSessionUsecase;
  final CreateGuestSessionUsecase createGuestSessionUsecase;
  AuthenticationCubit({
    required this.requestTokenUsecase,
    required this.createSessionUsecase,
    required this.createGuestSessionUsecase,
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

  bool isGuest = false;
  String? userSession = '';
  Future<void> createSession() async {
    emit(CreateSessionLoading());
    isGuest = false;
    final response = await createSessionUsecase(requestToken);
    response.fold(
      (fail) => emit(CreateSessionError()),
      (session) {
        userSession = session.sessionId;
        emit(CreateSessionSuccess());
      },
    );
  }

  String guestSession = '';
  Future<void> createGuestSession() async {
    emit(CreateGuestSessionLoading());
    isGuest = true;
    final response = await createGuestSessionUsecase(NoParams());
    response.fold(
      (fail) => emit(CreateGuestSessionError()),
      (session) {
        guestSession = session.guestSessionId;
        emit(CreateGuestSessionSuccess());
      },
    );
  }
}
