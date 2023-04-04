import 'package:flutter/material.dart';
import 'package:homemade_app/app/pages/home/home_page.dart';
import 'package:homemade_app/app/repositories/products/products_repository.dart';
import 'package:homemade_app/app/repositories/products/products_repository_impl.dart';
import 'package:provider/provider.dart';

import 'bloc/home_cubit.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductsRepository>(
            create: (context) => ProductsRepositoryImpl(
              dio: context.read(),
            ),
          ),
          Provider(
            create: (context) => HomeCubit(context.read()),
          ),
        ],
        child: const HomePage(),
      );
}
