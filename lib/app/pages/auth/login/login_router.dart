import 'package:flutter/material.dart';
import 'package:homemade_app/app/pages/auth/login/bloc/login_cubit.dart';
import 'package:homemade_app/app/pages/auth/login/login_page.dart';
import 'package:homemade_app/app/repositories/auth/auth_repository.dart';
import 'package:homemade_app/app/repositories/auth/auth_repository_impl.dart';
import 'package:provider/provider.dart';

class LoginRouter {
  LoginRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<AuthRepository>(
            create: (context) => AuthRepositoryImpl(
              dio: context.read(),
            ),
          ),
          Provider(
            create: (context) => LoginCubit(
              context.read(),
            ),
          )
        ],
        child: const LoginPage(),
      );
}
