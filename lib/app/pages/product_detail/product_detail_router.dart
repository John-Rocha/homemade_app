import 'package:flutter/material.dart';
import 'package:homemade_app/app/pages/product_detail/bloc/product_detail_cubit.dart';
import 'package:homemade_app/app/pages/product_detail/product_detail_page.dart';
import 'package:provider/provider.dart';

class ProductDetailRouter {
  ProductDetailRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider(
            create: (context) => ProductDetailCubit(),
          )
        ],
        builder: (context, child) {
          final args = ModalRoute.of(context)?.settings.arguments
              as Map<String, dynamic>;

          return ProductDetailPage(product: args['product']);
        },
      );
}
