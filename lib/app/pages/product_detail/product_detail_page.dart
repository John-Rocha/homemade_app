import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homemade_app/app/core/extensions/formatter_extension.dart';
import 'package:homemade_app/app/core/ui/base_state/base_state.dart';
import 'package:homemade_app/app/core/ui/helpers/size_extensions.dart';
import 'package:homemade_app/app/core/ui/styles/text_styles.dart';
import 'package:homemade_app/app/core/ui/widgets/delivery_app_bar.dart';
import 'package:homemade_app/app/core/ui/widgets/delivery_increment_decrement_button.dart';
import 'package:homemade_app/app/models/product_model.dart';
import 'package:homemade_app/app/pages/product_detail/bloc/product_detail_cubit.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;

  const ProductDetailPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseState<ProductDetailPage, ProductDetailCubit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(.4),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.product.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              widget.product.name,
              style: context.textStyles.textExtraBold.copyWith(
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: SingleChildScrollView(
                child: Text(widget.product.description),
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              BlocBuilder<ProductDetailCubit, int>(
                builder: (context, amount) {
                  return Container(
                    width: context.percentWidth(.5),
                    height: 68,
                    padding: const EdgeInsets.all(8),
                    child: DeliveryIncrementDecrementButton(
                      amount: controller.state,
                      incrementTap: controller.increment,
                      decrementTap: controller.decrement,
                    ),
                  );
                },
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: context.percentWidth(.5),
                height: 68,
                child: BlocBuilder<ProductDetailCubit, int>(
                  builder: (context, amount) {
                    return ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Adicionar',
                            style: context.textStyles.textExtraBold.copyWith(
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: AutoSizeText(
                              (widget.product.price * amount).currencyPTBR,
                              maxFontSize: 13,
                              minFontSize: 5,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: context.textStyles.textExtraBold.copyWith(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
