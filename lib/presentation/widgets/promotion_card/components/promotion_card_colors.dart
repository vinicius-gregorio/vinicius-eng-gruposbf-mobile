import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_colors.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_text_styles.dart';

class PromotionCardColors extends StatelessWidget {
  const PromotionCardColors({Key? key, required this.quantityOfColors}) : super(key: key);
  final int quantityOfColors;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      width: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: AppColors.greyFooter,
      ),
      child: Center(
          child: Text('$quantityOfColors cores', style: AppTextStyles.bodyRegularPGreySupport)),
    );
  }
}
