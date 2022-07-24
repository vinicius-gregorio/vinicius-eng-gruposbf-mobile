import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/pages/cart/components/cart_item_card/cart_item_card.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/pages/cart/components/order_resume/order_resume.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/states/cart_state.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/stores/cart_store.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_colors.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_text_styles.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/widgets/centauro_footer/centauro_footer.dart';

import '../../widgets/centauro_app_bar/centauro_app_bar.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final store = CartStore();
  @override
  void initState() {
    super.initState();
    store.getCart();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.appBackground,
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 104),
          child: CentauroAppBar(),
        ),
        body: ValueListenableBuilder(
            valueListenable: store,
            builder: (context, state, child) {
              if (state is LoadingCartState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is EmptyCartState) {
                return Center(
                  child: Text('Nenhum item no carrinho', style: AppTextStyles.bodyBoldGG),
                );
              }

              if (state is SuccessCartState) {
                print(state.cart);
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Meu Carrinho',
                                style: AppTextStyles.headingRedularXXS,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.cart.length,
                              itemBuilder: (context, index) {
                                CartItem cartItem = state.cart[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: CartItemCard(
                                    cartItem: cartItem,
                                    onMinusTap: () {},
                                    onPlusTap: () async {
                                      store.addToCart(cartItem);
                                    },
                                    onRemoveTap: () {
                                      store.removeOneItemQuantity(cartItem.id);
                                    },
                                    onRemoveAllTap: () {
                                      store.removeItem(cartItem.id);
                                    },
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            FutureBuilder<double>(
                                future: store.getSubtotal(),
                                builder: (context, snapshot) {
                                  return OrderResume(
                                    confirmOrder: () {},
                                    discount: 0.0,
                                    subtotal: snapshot.data ?? 0.0,
                                    total: 0,
                                  );
                                }),
                            const SizedBox(
                              height: 68,
                            ),
                          ],
                        ),
                      ),
                      const CentauroFooter(),
                    ],
                  ),
                );
              }

              if (state is ErrorCartState) {
                return Center(
                  child: Text(
                    state.message,
                    style: AppTextStyles.headBoldMd,
                  ),
                );
              }
              return Container();
            }),
      ),
    );
  }
}
