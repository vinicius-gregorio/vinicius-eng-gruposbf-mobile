import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_colors.dart';

class AppTextStyles {
  static TextStyle searchHintText = GoogleFonts.roboto(
      fontWeight: FontWeight.w300,
      fontSize: 14,
      color: AppColors.greyHintText,
      fontStyle: FontStyle.italic);

  static TextStyle headBoldMd = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 26,
    color: AppColors.blackHeadlineText,
  );

  static TextStyle bodyRegularPWhite = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColors.appBackground,
  );

  static TextStyle bodyRegularPBlack = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColors.blackHeadlineText,
  );

  static TextStyle bodyRegularPGrey = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColors.greyDarkBackground,
  );

  static TextStyle bodyBoldGG = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: AppColors.blackHeadlineText,
  );

  static TextStyle oldPrice = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 10,
    color: AppColors.greyDarkBackground,
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle buttonText = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 18,
    color: AppColors.greyDarkBackground,
  );
}
