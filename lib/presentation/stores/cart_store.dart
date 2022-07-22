import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/get_cart_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/states/cart_state.dart';

class CartStore extends ValueNotifier {
  CartStore() : super(InitialCartState());

  Future getCart() async {
    value = LoadingCartState();
    try {
      var service = GetIt.I.get<GetCartUsecase>();
      var fold = await service();
    } catch (e) {
      value = ErrorCartState(e.toString());
    }
  }
}
