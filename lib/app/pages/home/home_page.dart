import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_app/app/core/ui/base_state/base_state.dart';
import 'package:homemade_app/app/core/ui/helpers/loader.dart';
import 'package:homemade_app/app/core/ui/helpers/messages.dart';
import 'package:homemade_app/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:homemade_app/app/models/product_model.dart';
import 'package:homemade_app/app/pages/home/bloc/home_bloc.dart';
import 'package:homemade_app/app/pages/home/widgets/delivery_product_tile.dart';
import 'package:provider/provider.dart';

import 'bloc/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeBloc> {
  @override
  void onReady() {
    super.onReady();
    controller.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: BlocConsumer<HomeBloc, HomeState>(
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          loaded: () => true,
        ),
        listener: (context, state) {
          state.status.matchAny(
            error: () {
              hideLoader();
              showError(state.errorMessage ?? 'Erro não informado');
            },
            loading: () => showLoader(),
            any: () => hideLoader(),
          );
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async => controller.loadProducts(),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return DeliveryProductTile(product: product);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
