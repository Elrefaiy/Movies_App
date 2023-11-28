part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class ChangeIndexState extends AuthenticationState {}

class CreateRequestTokenSuccess extends AuthenticationState {}

class CreateRequestTokenError extends AuthenticationState {}
