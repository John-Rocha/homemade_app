import 'package:flutter/material.dart';
import 'package:homemade_app/app/core/ui/styles/text_styles.dart';
import 'package:homemade_app/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:homemade_app/app/core/ui/widgets/delivery_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: context.textStyles.textTitle,
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Email'),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Senha'),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: DeliveryButton(
                        label: 'Login',
                        width: double.infinity,
                        onPressed: () {},
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
    );
  }
}
