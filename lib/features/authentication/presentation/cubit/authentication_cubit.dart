import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_application/core/utils/app_strings.dart';
import 'package:movies_application/features/authentication/domain/usecases/delete_session_usecase.dart';
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
  final DeleteSessionUsecase deleteSessionUsecase;
  AuthenticationCubit({
    required this.requestTokenUsecase,
    required this.createSessionUsecase,
    required this.createGuestSessionUsecase,
    required this.deleteSessionUsecase,
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
      (session) async {
        guestSession = session.guestSessionId;
        await di.sl<SharedPreferences>().setBool(AppStrings.isGeust, true);
        emit(CreateGuestSessionSuccess());
      },
    );
  }

  Future<void> deleteSession() async {
    var session =
        await di.sl<SharedPreferences>().getString(AppStrings.sessionId)!;
    final response = await deleteSessionUsecase(session);

    response.fold(
      (l) => emit(DeleteSessionError()),
      (r) async {
        await di.sl<SharedPreferences>().remove(AppStrings.sessionId);
        emit(DeleteSessionSuccess());
      },
    );
  }

  bool isGuest() {
    return di.sl<SharedPreferences>().getBool(AppStrings.isGeust) ?? false;
  }
}
