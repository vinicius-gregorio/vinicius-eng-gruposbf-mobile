import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_colors.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_text_styles.dart';

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
      child: Center(child: Text('Frete Grátis', style: AppTextStyles.bodyRegularPWhite)),
    );
  }
}
