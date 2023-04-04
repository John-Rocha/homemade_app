import 'package:flutter/material.dart';
import 'package:homemade_app/app/core/ui/widgets/delivery_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Column(
        children: [
          Container(),
          DeliveryButton(
            label: 'Teste Label',
            onPressed: () {},
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Text'),
          ),
        ],
      ),
    );
  }
}
