import 'package:flutter/material.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/pages/cart/components/cart_item_card.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/states/cart_state.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/stores/cart_store.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/style/app_text_styles.dart';

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
                return ListView(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: Text(
                        'Promoções em destaque',
                        style: AppTextStyles.headBoldMd,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.cart.length,
                      itemBuilder: (context, index) {
                        CartItem cartItem = state.cart[index];
                        return CartItemCard(
                          cartItem: cartItem,
                        );
                      },
                    ),
                  ],
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
