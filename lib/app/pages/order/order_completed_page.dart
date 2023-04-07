import 'package:flutter/material.dart';
import 'package:homemade_app/app/core/ui/widgets/delivery_app_bar.dart';

class OrderCompletedPage extends StatelessWidget {
  const OrderCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Text('Sucesso'),
    );
  }
}
