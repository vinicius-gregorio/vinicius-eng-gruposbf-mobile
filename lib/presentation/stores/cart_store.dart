import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/add_to_cart_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/get_cart_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/remove_from_cart_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/remove_single_item_from_cart.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/states/cart_state.dart';

class CartStore extends ValueNotifier {
  CartStore() : super(InitialCartState());

  Future getCart() async {
    value = LoadingCartState();
    try {
      var service = GetIt.I.get<GetCartUsecase>();
      var fold = await service();
      List<CartItem> cart = fold.fold((l) => [], (r) => r);
      if (cart.isEmpty) {
        value = EmptyCartState();
      } else {
        value = SuccessCartState(cart);
      }
    } catch (e) {
      value = ErrorCartState(e.toString());
    }
  }

  void addToCart(CartItem cartItem) async {
    try {
      var service = GetIt.I.get<AddToCartUsecase>();
      await service(cartItem);
      await getCart();
    } catch (e) {
      value = ErrorCartState(e.toString());
    }
  }

  void removeOneItemQuantity(String cartItemId) async {
    try {
      var service = GetIt.I.get<RemoveSingleItemFromCartUsecase>();
      await service(cartItemId);
      await getCart();
    } catch (e) {
      value = ErrorCartState(e.toString());
    }
  }

  void removeItem(String cartItemId) async {
    try {
      var service = GetIt.I.get<RemoveFromCartUsecase>();
      await service(cartItemId);
      await getCart();
    } catch (e) {
      value = ErrorCartState(e.toString());
    }
  }
}
