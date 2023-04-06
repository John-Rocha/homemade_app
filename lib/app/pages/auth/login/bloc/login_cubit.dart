import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_app/app/core/exceptions/unauthorized_exception.dart';
import 'package:homemade_app/app/pages/auth/login/bloc/login_state.dart';
import 'package:homemade_app/app/repositories/auth/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(const LoginState.initial());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: LoginStatus.login));

    try {
      final authModel = await _authRepository.login(email, password);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('accessToken', authModel.accessToken);
      prefs.setString('refreshToken', authModel.refreshToken);
      emit(state.copyWith(status: LoginStatus.success));
    } on UnauthorizedException catch (e, s) {
      log('Login e/ou senha inválidos', error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: LoginStatus.loginError,
          errorMessage: 'Login e/ou senha inválidos',
        ),
      );
    } catch (e, s) {
      log('Erro ao realizar o login', error: e, stackTrace: s);
      emit(
        state.copyWith(
          status: LoginStatus.error,
          errorMessage: 'Erro ao realizar o login',
        ),
      );
    }
  }
}
