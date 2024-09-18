import 'dart:math';

import 'package:bookia/core/services/local_storage.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:bookia/features/auth/presentation/bloc/auth_event.dart';
import 'package:bookia/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>(register);
    on<LoginEvent>(login);
  }

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(RegisterLoadingState());
    try {
      var result = await AuthRepo.register(event.params);
      if (result != null) {
        LocalStorage.CasheData(
            key: LocalStorage.token, value: result.data?.token);
        emit(RegisterSuccessState());
      } else {
        emit(RegisterErrorState("Registration failed"));
      }
    } catch (e) {
      emit(RegisterErrorState('Something went wrong: ${e.toString()}'));
    }
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    print("Login event received");
    emit(LoginLoadingState());
    try {
      var value =
          await AuthRepo.login(email: event.email, password: event.password);
      if (value != null) {
        LocalStorage.CasheData(
            key: LocalStorage.token, value: value.data?.token);
        print("Login successful!");
        emit(LoginSuccessState());
      } else {
        print("Login failed");
        emit(LoginErrorState("Login failed"));
      }
    } catch (e) {
      print("Exception: $e");
      emit(LoginErrorState('Something went wrong'));
    }
  }
}
