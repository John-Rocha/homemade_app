import 'package:flutter/material.dart';
import 'package:homemade_app/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:homemade_app/app/models/product_model.dart';
import 'package:homemade_app/app/pages/home/widgets/delivery_product_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => DeliveryProductTile(
                product: ProductModel(
                  id: 0,
                  name: 'Lanche X',
                  description:
                      'Lanche acompanha pão, blend, mussarela e maionese',
                  price: 15.5,
                  image:
                      'https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
