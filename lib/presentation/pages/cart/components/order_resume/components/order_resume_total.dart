import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_text_styles.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/utils/extensions.dart';

class OrderResumeTotal extends StatelessWidget {
  const OrderResumeTotal({Key? key, required this.price}) : super(key: key);
  final double price;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total', style: AppTextStyles.headingBoldSM),
          Text(price.formatToBrl(), style: AppTextStyles.headingBoldSM),
        ],
      ),
    );
  }
}
