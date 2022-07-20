import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_colors.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_images.dart';

class CentauroFooter extends StatelessWidget {
  const CentauroFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.greyFooter,
      width: double.infinity,
      height: 72,
      child: Center(
        child: SvgPicture.asset(AppImages.centauroLogoBlack),
      ),
    );
  }
}
