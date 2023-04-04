import 'package:flutter/material.dart';
import 'package:homemade_app/app/core/ui/helpers/size_extensions.dart';
import 'package:homemade_app/app/core/ui/widgets/delivery_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color(0xFF140e0e),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenWidth,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: context.percentHeight(.20)),
                  SizedBox(
                    width: context.percentHeight(.25),
                    child: Image.asset(
                      'assets/images/logo_homemade.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 80),
                  DeliveryButton(
                    width: context.percentWidth(.60),
                    heigth: 35,
                    label: 'Acessar',
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
