import 'package:flutter/material.dart';

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
          ElevatedButton(
            onPressed: () {},
            child: Text('Teste'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Text'),
          ),
        ],
      ),
    );
  }
}
