import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_app/app/core/ui/styles/text_styles.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/base_state/base_state.dart';
import '../../../core/ui/widgets/delivery_app_bar.dart';
import '../../../core/ui/widgets/delivery_button.dart';
import 'bloc/login_cubit.dart';
import 'bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends BaseState<LoginPage, LoginCubit> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.status.matchAny(
          login: () => showLoader(),
          error: () {
            hideLoader();
            showError('Erro ao efetuar o login');
          },
          loginError: () {
            hideLoader();
            showError(state.errorMessage ?? 'E-mail e/ou senha inválidos');
          },
          success: () {
            hideLoader();
            Navigator.pop(context, true);
          },
          any: () => hideLoader(),
        );
      },
      child: Scaffold(
        appBar: DeliveryAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: context.textStyles.textTitle,
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _emailEC,
                        decoration: const InputDecoration(
                          label: Text('Email'),
                        ),
                        validator: Validatorless.multiple([
                          Validatorless.required('E-mail obrigatório'),
                          Validatorless.email('E-mail inválido'),
                        ]),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _passwordEC,
                        obscureText: true,
                        decoration: const InputDecoration(
                          label: Text('Senha'),
                        ),
                        validator:
                            Validatorless.required('Senha é obrigatória'),
                      ),
                      const SizedBox(height: 50),
                      Center(
                        child: DeliveryButton(
                          label: 'Entrar',
                          width: double.infinity,
                          onPressed: () {
                            final valid =
                                _formKey.currentState?.validate() ?? false;

                            if (valid) {
                              controller.login(
                                _emailEC.text,
                                _passwordEC.text,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Não possui uma conta?',
                        style: context.textStyles.textBold,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/auth/register');
                        },
                        child: Text(
                          'Cadastre-se',
                          style: context.textStyles.textBold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
