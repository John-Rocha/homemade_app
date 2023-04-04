import 'package:flutter/material.dart';
import 'package:homemade_app/app/core/ui/styles/colors_app.dart';
import 'package:homemade_app/app/core/ui/styles/text_styles.dart';

class DeliveryIncrementDecrementButton extends StatelessWidget {
  const DeliveryIncrementDecrementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '-',
              style: context.textStyles.textMedium.copyWith(
                fontSize: 22,
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            '1',
            style: context.textStyles.textRegular.copyWith(
              fontSize: 17,
              color: context.colors.secondary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '+',
              style: context.textStyles.textMedium.copyWith(
                fontSize: 22,
                color: context.colors.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
