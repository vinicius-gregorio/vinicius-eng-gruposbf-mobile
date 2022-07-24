import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_colors.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_text_styles.dart';

class QuantityButtons extends StatelessWidget {
  const QuantityButtons(
      {Key? key, required this.quantity, required this.pressPlus, required this.pressMinus})
      : super(key: key);
  final int quantity;
  final VoidCallback pressPlus;
  final VoidCallback pressMinus;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 74,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              pressMinus();
            },
            child: Container(
              alignment: Alignment.center,
              height: 24,
              width: 24,
              decoration: const BoxDecoration(
                color: AppColors.greyFooter,
                border: Border(right: BorderSide(color: AppColors.greyBorder, width: 1)),
              ),
              child: Text(
                '-',
                style: AppTextStyles.icon,
              ),
            ),
          ),
          Container(
            height: 24,
            width: 24,
            color: AppColors.appBackground,
            child: Center(
              child: Text(
                quantity.toString(),
                style: AppTextStyles.quantityInCard,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('tap buy component');
              pressPlus();
            },
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.greyFooter,
                border: Border(left: BorderSide(color: AppColors.greyBorder, width: 1)),
              ),
              alignment: Alignment.center,
              height: 24,
              width: 24,
              child: Text(
                '+',
                style: AppTextStyles.icon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
