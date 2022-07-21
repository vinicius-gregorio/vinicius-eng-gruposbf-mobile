import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_colors.dart';

class PromotionCardFreeShippingCard extends StatelessWidget {
  const PromotionCardFreeShippingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: AppColors.greyDarkBackground,
      ),
      child: const Center(
          child: Text('Frete Grátis', style: TextStyle(color: Colors.white, fontSize: 12))),
    );
  }
}
