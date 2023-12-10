import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/create_guest_session_usecase.dart';
import '../../domain/usecases/create_session_usecase.dart';
import '../../domain/usecases/request_token_usecase.dart';
import '../../../../injection_container.dart' as di;

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
  Future<void> createToken() async {
    emit(CreateRequestTokenLoading());
    final response = await requestTokenUsecase(NoParams());
    response.fold(
      (fail) => emit(CreateRequestTokenError()),
      (requestToken) {
        this.requestToken = requestToken.requestToken;
        emit(CreateRequestTokenSuccess());
      },
    );
  }

  String? userSession = '';
  Future<void> createSession() async {
    emit(CreateSessionLoading());
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
    final response = await createGuestSessionUsecase(NoParams());
    response.fold(
      (fail) => emit(CreateGuestSessionError()),
      (session) {
        guestSession = session.guestSessionId;
        emit(CreateGuestSessionSuccess());
      },
    );
  }

  bool isGuest() {
    var session = di.sl<SharedPreferences>().getString(AppStrings.guestSession);
    if (session == null) {
      return false;
    }
    return true;
  }
}
