import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/states/home_state.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/stores/home_store.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_colors.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_images.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_text_styles.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/centauro_app_bar/centauro_app_bar.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/centauro_footer/centauro_footer.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/promotion_card/promotion_card.dart';

import '../../../domain/entities/promotion.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = HomeStore();
  @override
  void initState() {
    store.getPromotions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.appBackground,
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 104),
            child: CentauroAppBar(cartLength: 2),
          ),
          body: ValueListenableBuilder(
              valueListenable: store,
              builder: ((context, state, child) {
                if (state is LoadingHomeState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.redBackground,
                    ),
                  );
                }

                if (state is SuccessHomeState) {
                  return ListView(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Image.asset(
                        AppImages.promotionBanner,
                        fit: BoxFit.cover,
                      ),
                      Center(
                        child: Text(
                          'Promoções em destaque',
                          style: AppTextStyles.headingBoldMd,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 10,
                              mainAxisExtent: 354),
                          itemCount: state.promotions.length,
                          itemBuilder: ((context, index) {
                            Promotion promotion = state.promotions[index];
                            return PromotionCard(
                              promotion: promotion,
                              onTapBuy: () => store.addToCart(CartItem(
                                  id: promotion.id,
                                  name: promotion.name,
                                  image: promotion.image,
                                  quantity: 1,
                                  oldPrice: promotion.oldPrice,
                                  price: promotion.price)),
                            );
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 47,
                      ),
                      const CentauroFooter(),
                    ],
                  );
                }
                return const SizedBox.shrink();
              }))),
    );
  }
}
