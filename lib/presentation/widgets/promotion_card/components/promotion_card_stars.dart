import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_images.dart';

class PromotionCardStars extends StatelessWidget {
  final int numberOfStars;

  const PromotionCardStars({
    Key? key,
    required this.numberOfStars,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numberOfFilledStars = numberOfStars;
    int numberOfEmptyStars = 0;
    return Row(
      children: [
        // for (int i = 0; i < numberOfFilledStars; i++)
        //   Padding(
        //     padding: const EdgeInsets.only(left: 5.31),
        //     child: SvgPicture.asset(AppImages.starIcon),
        //   ),
        ..._buildFilledStars(numberOfFilledStars),
        ..._buildEmptyStars(),
      ],
    );
  }

  List<Widget> _buildFilledStars(int numberOfStars) {
    List<Widget> stars = [];
    for (int i = 0; i < numberOfStars; i++) {
      stars.add(Padding(
        padding: const EdgeInsets.only(left: 5.31),
        child: SvgPicture.asset(AppImages.starIcon),
      ));
    }
    return stars;
  }

  List<Widget> _buildEmptyStars() {
    int numberOfEmptyStars = numberOfStars - 5;
    List<Widget> stars = [];

    if (numberOfStars == 5 || numberOfEmptyStars < 1) {
      return stars;
    }

    for (int i = 0; i < numberOfEmptyStars; i++) {
      stars.add(Padding(
        padding: const EdgeInsets.only(left: 5.31),
        child: SvgPicture.asset(AppImages.starEmptyIcon),
      ));
    }
    return stars;
  }
}
