part of 'account_cubit.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {}

class GetAccountDetailsSuccess extends AccountState {}

class GetAccountDetailsError extends AccountState {}

class GetFavoritesLoading extends AccountState {}

class GetFavoritesSuccess extends AccountState {}

class GetFavoritesError extends AccountState {}
