import 'package:flutter/material.dart';
import 'package:homemade_app/app/core/config/env/env.dart';
import 'package:homemade_app/app/core/ui/helpers/size_extensions.dart';
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
            label: Env.i['backend_base_url'] ?? '',
            onPressed: () {},
          ),
          Text(context.screenHeight.toString()),
          Text(context.screenWidth.toString()),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Text'),
          ),
        ],
      ),
    );
  }
}
