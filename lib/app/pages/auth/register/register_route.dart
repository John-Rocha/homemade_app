import 'package:flutter/material.dart';
import 'package:homemade_app/app/pages/auth/register/bloc/register_cubit.dart';
import 'package:homemade_app/app/pages/auth/register/register_page.dart';
import 'package:homemade_app/app/repositories/auth/auth_repository.dart';
import 'package:homemade_app/app/repositories/auth/auth_repository_impl.dart';
import 'package:provider/provider.dart';

class RegisterRoute {
  RegisterRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<AuthRepository>(
            create: (context) => AuthRepositoryImpl(
              dio: context.read(),
            ),
          ),
          Provider(
            create: (context) => RegisterCubit(
              context.read(),
            ),
          )
        ],
        child: const RegisterPage(),
      );
}
