import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vinicius_eng_gruposbf_mobile/config/custom_router.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_images.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_text_styles.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key, required this.cartLength}) : super(key: key);
  final double cartLength;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomRouter().push(context, '/cart');
      },
      child: Stack(
        children: [
          SvgPicture.asset(cartLength < 1 ? AppImages.cartEmptyIcon : AppImages.cartIcon),
          if (cartLength != 0)
            Positioned(
                right: 7.5,
                top: 1,
                child: Text(cartLength.floor().toString(), style: AppTextStyles.cartText)),
        ],
      ),
    );
  }
}
