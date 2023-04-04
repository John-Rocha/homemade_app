import 'package:flutter/material.dart';
import 'package:homemade_app/app/pages/home/bloc/home_bloc.dart';
import 'package:homemade_app/app/pages/home/home_page.dart';
import 'package:homemade_app/app/repositories/products/products_repository.dart';
import 'package:homemade_app/app/repositories/products/products_repository_impl.dart';
import 'package:provider/provider.dart';

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
            create: (context) => HomeBloc(context.read()),
          ),
        ],
        child: const HomePage(),
      );
}
