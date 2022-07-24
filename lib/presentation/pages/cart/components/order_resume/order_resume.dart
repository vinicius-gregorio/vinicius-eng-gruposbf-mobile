import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/pages/cart/components/order_resume/components/order_resume_header.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/pages/cart/components/order_resume/components/order_resume_total.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_text_styles.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/app_button.dart';

class OrderResume extends StatelessWidget {
  const OrderResume({
    Key? key,
    required this.confirmOrder,
    required this.subtotal,
    required this.discount,
    required this.total,
  }) : super(key: key);

  final VoidCallback confirmOrder;
  final double subtotal;
  final double discount;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          const OrderResumeHeader(),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal', style: AppTextStyles.bodyRegularPBlack),
                Text('R\$ $subtotal', style: AppTextStyles.icon),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Desconto', style: AppTextStyles.bodyRegularPBlack),
                Text('R\$ $discount', style: AppTextStyles.icon),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OrderResumeTotal(
              price: total,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: AppButton(
                height: 48,
                buttonText: 'Concluir Pedido',
                onPressed: () {
                  confirmOrder();
                }),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
