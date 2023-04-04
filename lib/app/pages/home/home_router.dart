import 'package:flutter/material.dart';
import 'package:homemade_app/app/pages/home/home_page.dart';
import 'package:homemade_app/app/repositories/products/products_repository_impl.dart';
import 'package:provider/provider.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => ProductsRepositoryImpl(
              dio: context.read(),
            ),
          ),
        ],
        child: const HomePage(),
      );
}
