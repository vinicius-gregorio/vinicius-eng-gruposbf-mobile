import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_text_styles.dart';

class OrderResumeHeader extends StatelessWidget {
  const OrderResumeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Resumo do Pedido',
          style: AppTextStyles.bodyBoldXL,
        ),
        Text(
          '___',
          style: AppTextStyles.bodyBoldXL,
        ),
      ],
    );
  }
}
