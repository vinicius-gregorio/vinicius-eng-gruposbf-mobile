import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/pages/cart/components/cart_item_card/components/quantity_buttons.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_images.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_text_styles.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key? key,
    required this.cartItem,
    required this.onRemoveTap,
    required this.onRemoveAllTap,
    required this.onPlusTap,
    required this.onMinusTap,
  }) : super(key: key);

  final CartItem cartItem;
  final VoidCallback onRemoveTap;
  final VoidCallback onPlusTap;
  final VoidCallback onMinusTap;
  final VoidCallback onRemoveAllTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 156,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Image.network(
              cartItem.image,
              height: 80,
              width: 80,
            ),
            const SizedBox(
              width: 32,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${cartItem.name}${cartItem.name}',
                    overflow: TextOverflow.fade,
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      QuantityButtons(
                        quantity: cartItem.quantity,
                        pressPlus: () {
                          onPlusTap();
                        },
                        pressMinus: () {
                          onRemoveTap();
                        },
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      GestureDetector(
                        onTap: () {
                          onRemoveAllTap();
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(AppImages.closeIcon),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              'Remover',
                              style: AppTextStyles.bodyRegularXS,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('R\$ ${cartItem.price}', style: AppTextStyles.bodyBoldGG),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('R\$${cartItem.oldPrice}', style: AppTextStyles.oldPrice),
                ],
              ),
            ),
          ],
        ));
  }
}
