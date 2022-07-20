import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/states/home_state.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/stores/home_store.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_images.dart';
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
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 104),
            child: CentauroAppBar(),
          ),
          body: ValueListenableBuilder(
              valueListenable: store,
              builder: ((context, state, child) {
                if (state is LoadingHomeState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is SuccessHomeState) {
                  return ListView(
                    children: [
                      Image.asset(AppImages.promotionBanner),
                      const Center(
                        child: Text(
                          'Promoções em destaque',
                          style: TextStyle(fontSize: 26),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(16),
                      //   child: ListView.builder(
                      //       shrinkWrap: true,
                      //       physics: const NeverScrollableScrollPhysics(),
                      //       itemBuilder: ((context, index) {
                      //         Promotion promotion = state.promotions[index];
                      //         return ListTile(
                      //           title: Text(promotion.name),
                      //         );
                      //       }),
                      //       itemCount: state.promotions.length),
                      // ),
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
                            return PromotionCard(promotion: promotion);
                          }),
                        ),
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
