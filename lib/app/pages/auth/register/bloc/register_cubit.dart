import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_app/app/pages/auth/register/bloc/register_state.dart';
import 'package:homemade_app/app/repositories/auth/auth_repository.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit(this._authRepository) : super(const RegisterState.initial());

  Future<void> register(String name, String email, String password) async {
    try {
      emit(state.copyWith(status: RegisterStatus.register));

      await _authRepository.register(name, email, password);

      emit(state.copyWith(status: RegisterStatus.success));
    } catch (e, s) {
      log('Erro ao registrar o usuário', error: e, stackTrace: s);
      emit(state.copyWith(status: RegisterStatus.error));
    }
  }
}
