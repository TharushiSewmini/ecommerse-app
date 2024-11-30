import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/utils/pageTransition.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final User user;
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<LoginEvent>(login);
  }

  FutureOr<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
// delaying some times to simulate process
      await Future.delayed(Duration(seconds: 3));
      user = User(userName: event.email, password: event.password);
      emit(LoginSuccessState(user: user));
   
    } catch (e) {
      emit(LoginErrorState(errorMessage: "Failed To Login"));
    }
  }
}
