import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/get_cart_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/states/appbar_state.dart';

class AppBarStore extends ValueNotifier {
  AppBarStore() : super(LoadingAppBarState());

  Future getCartLength() async {
    value = LoadingAppBarState();
    try {
      var service = GetIt.I.get<GetCartUsecase>();
      var fold = await service();
      List<CartItem> cart = fold.fold((l) => [], (r) => r);
      double cartLength = 0;

      // ignore: avoid_function_literals_in_foreach_calls
      cart.forEach((element) {
        cartLength++;
      });
      if (cart.isEmpty) {
        value = SuccessAppBarState(0);
      } else {
        value = SuccessAppBarState(cartLength);
      }
    } catch (e) {
      value = ErrorAppBarState(e.toString());
    }
  }
}
