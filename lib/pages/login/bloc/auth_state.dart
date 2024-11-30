part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class LoginSuccessState extends AuthState {
  final User user;
  LoginSuccessState({required this.user});
}

final class LoginErrorState extends AuthState {
  final String errorMessage;
  LoginErrorState({required this.errorMessage});
}
