import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_colors.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_images.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/centauro_app_bar/components/cart_icon.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/centauro_app_bar/components/search_input.dart';

class CentauroAppBar extends StatelessWidget {
  const CentauroAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: Container(
        height: 104,
        width: double.infinity,
        color: AppColors.redBackground,
        padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 32,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SvgPicture.asset(AppImages.centauroLogoWhite),
                    ),
                    Expanded(child: Container()),
                    const CartIcon(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            const SearchInput(),
          ],
        ),
      ),
    );
  }
}
