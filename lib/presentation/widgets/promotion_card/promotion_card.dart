import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/promotion.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_colors.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/app_button.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/promotion_card/components/promotion_card_colors.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/promotion_card/components/promotion_card_stars.dart';

import 'components/promotion_card_free_shipping_card.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard({Key? key, required this.promotion}) : super(key: key);
  final Promotion promotion;

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
              Text(
                promotion.name,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text('R\$ ${promotion.price}', style: const TextStyle(fontSize: 22)),
                  const SizedBox(
                    width: 8,
                  ),
                  Text('R\$ ${promotion.oldPrice}',
                      style: const TextStyle(fontSize: 10, decoration: TextDecoration.lineThrough)),
                ],
              ),
              const SizedBox(height: 10.87),
              Row(
                children: [
                  PromotionCardStars(numberOfStars: promotion.rate),
                  const SizedBox(width: 7.3),
                  Text(
                    '(${promotion.reviews})',
                    style: const TextStyle(fontSize: 10),
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
                  child: AppButton(buttonText: 'COMPRAR', onPressed: () {})),
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
              child: Center(
                  child: Text('${promotion.discount}%',
                      style: const TextStyle(fontSize: 10, color: AppColors.redBackground))),
            ),
          ),
        ],
      ),
    );
  }
}
