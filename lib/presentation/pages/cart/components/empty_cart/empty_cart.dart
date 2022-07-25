import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vinicius_eng_gruposbf_mobile/config/custom_router.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_images.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_text_styles.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/app_button.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/centauro_footer/centauro_footer.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 32),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 68,
              ),
              Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(AppImages.shoppingCartError)),
              const SizedBox(
                height: 32,
              ),
              Text('Seu carrinho \nestá vazio...', style: AppTextStyles.headingBoldMd),
              const SizedBox(
                height: 16,
              ),
              Text(
                  'São milhares de produtos para você escolher\nEscolha seus produtos e adicione em seu carrinho',
                  style: AppTextStyles.bodyRegularMd),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 201,
                child: AppButton(
                    height: 48,
                    buttonText: 'Comece a comprar',
                    onPressed: () {
                      CustomRouter().pop(context);
                    }),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 53,
        ),
        const CentauroFooter(),
      ],
    );
  }
}
