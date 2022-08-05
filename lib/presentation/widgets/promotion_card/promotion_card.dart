import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/config/custom_router.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/promotion.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_colors.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_text_styles.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/app_button.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/promotion_card/components/promotion_card_colors.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/promotion_card/components/promotion_card_stars.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/utils/extensions.dart';
import 'components/promotion_card_free_shipping_card.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard({Key? key, required this.promotion, required this.onTapBuy})
      : super(key: key);
  final Promotion promotion;
  final VoidCallback onTapBuy;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 354,
      width: 160,
      padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Image.network(
                promotion.image,
                width: 144,
                height: 144,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 3),
              Visibility(
                visible: promotion.freeShipping,
                replacement: const SizedBox(
                  height: 18,
                ),
                child: const PromotionCardFreeShippingCard(),
              ),
              const SizedBox(height: 3),
              Expanded(
                child: Container(),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  promotion.name,
                  style: AppTextStyles.bodyRegularPBlack,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(promotion.price.formatToBrl(), style: AppTextStyles.bodyBoldGG),
                  const SizedBox(
                    width: 8,
                  ),
                  Text('R\$${promotion.oldPrice.toString().replaceAll('.', ',')}',
                      style: AppTextStyles.oldPrice),
                ],
              ),
              const SizedBox(height: 10.87),
              Row(
                children: [
                  PromotionCardStars(numberOfStars: promotion.rate),
                  const SizedBox(width: 7.3),
                  Text(
                    '(${promotion.reviews})',
                    style: AppTextStyles.supportLightP,
                  ),
                ],
              ),
              const SizedBox(
                height: 6.87,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: PromotionCardColors(quantityOfColors: promotion.colors)),
              Expanded(
                child: Container(),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: AppButton(
                      buttonText: 'COMPRAR',
                      onPressed: () {
                        onTapBuy();
                        CustomRouter().push(context, '/cart');
                      })),
            ],
          ),
          Positioned(
            left: 132,
            child: Container(
              height: 16,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: AppColors.appBackground,
                border: Border.all(color: AppColors.redBackground, width: 1),
              ),
              child:
                  Center(child: Text('${promotion.discount}%', style: AppTextStyles.discountRed)),
            ),
          ),
        ],
      ),
    );
  }
}
