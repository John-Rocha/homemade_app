import 'package:flutter/material.dart';
import 'package:homemade_app/app/pages/order/bloc/order_cubit.dart';
import 'package:homemade_app/app/pages/order/order_page.dart';
import 'package:provider/provider.dart';

class OrderRoute {
  OrderRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => OrderCubit(),
          )
        ],
        child: const OrderPage(),
      );
}
