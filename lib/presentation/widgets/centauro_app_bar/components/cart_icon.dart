import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/pages/cart/cart_page.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_images.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage()));
      },
      child: SvgPicture.asset(AppImages.cartIcon),
    );
  }
}
