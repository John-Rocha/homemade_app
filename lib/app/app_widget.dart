import 'package:flutter/material.dart';
import 'package:homemade_app/app/core/provider/application_binding.dart';
import 'package:homemade_app/app/core/ui/theme/theme_config.dart';
import 'package:homemade_app/app/pages/auth/login/login_page.dart';
import 'package:homemade_app/app/pages/home/home_router.dart';
import 'package:homemade_app/app/pages/product_detail/product_detail_router.dart';
import 'package:homemade_app/app/pages/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Homemade',
        theme: ThemeConfig.theme,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/productDetail': (context) => ProductDetailRouter.page,
          '/auth/login': (context) => const LoginPage(),
        },
      ),
    );
  }
}
