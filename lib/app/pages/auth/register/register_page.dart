import 'package:flutter/material.dart';
import 'package:homemade_app/app/core/ui/styles/text_styles.dart';
import 'package:homemade_app/app/core/ui/widgets/delivery_app_bar.dart';

import '../../../core/ui/widgets/delivery_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastro',
                  style: context.textStyles.textTitle,
                ),
                Text(
                  'Preencha os campos abaixo para criar o cadastro.',
                  style: context.textStyles.textMedium.copyWith(fontSize: 18),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Nome'),
                  ),
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
                const SizedBox(height: 30),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Confirma senha'),
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: DeliveryButton(
                    label: 'Cadastrar',
                    width: double.infinity,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
