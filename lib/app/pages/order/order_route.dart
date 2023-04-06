import 'package:flutter/material.dart';
import 'package:homemade_app/app/pages/order/bloc/order_cubit.dart';
import 'package:homemade_app/app/pages/order/order_page.dart';
import 'package:homemade_app/app/repositories/order/order_repository.dart';
import 'package:homemade_app/app/repositories/order/order_repository_impl.dart';
import 'package:provider/provider.dart';

class OrderRoute {
  OrderRoute._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<OrderRepository>(
            create: (context) => OrderRepositoryImpl(dio: context.read()),
          ),
          Provider(
            create: (context) => OrderCubit(
              orderRepository: context.read(),
            ),
          )
        ],
        child: const OrderPage(),
      );
}
