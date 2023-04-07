import 'package:flutter/material.dart';
import 'package:homemade_app/app/core/global/global_context.dart';
import 'package:homemade_app/app/pages/order/order_completed_page.dart';

import 'core/provider/application_binding.dart';
import 'core/ui/theme/theme_config.dart';
import 'pages/auth/login/login_router.dart';
import 'pages/auth/register/register_route.dart';
import 'pages/home/home_router.dart';
import 'pages/order/order_route.dart';
import 'pages/product_detail/product_detail_router.dart';
import 'pages/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  final _navKey = GlobalKey<NavigatorState>();

  AppWidget({super.key}) {
    GlobalContext.i.navigatorKey = _navKey;
  }

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Homemade',
        theme: ThemeConfig.theme,
        navigatorKey: _navKey,
        routes: {
          '/': (context) => const SplashPage(),
          '/home': (context) => HomeRouter.page,
          '/productDetail': (context) => ProductDetailRouter.page,
          '/auth/login': (context) => LoginRouter.page,
          '/auth/register': (context) => RegisterRoute.page,
          '/order': (context) => OrderRoute.page,
          '/order/completed': (context) => const OrderCompletedPage(),
        },
      ),
    );
  }
}
