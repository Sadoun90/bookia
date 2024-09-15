import 'dart:math';

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
      await AuthRepo.register(event.params).then((value) {
        if (value != null) {
          emit(RegisterSuccessState());
        } else {
          emit(RegisterErrorState("Something wrong occured"));
        }
      });
    } on Exception catch (e) {
      emit(RegisterErrorState('Something went wrong'));
    }
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(LoginLoadingState());
    try {
      await AuthRepo.login(email: event.email , password: event.password).then((value) {
        if (value != null) {
          emit(LoginSuccessState());
        } else {
          emit(LoginErrorState("Something wrong occured"));
        }
      });
    } on Exception catch (e) {
      emit(LoginErrorState('Something went wrong'));
    }
  }
}
