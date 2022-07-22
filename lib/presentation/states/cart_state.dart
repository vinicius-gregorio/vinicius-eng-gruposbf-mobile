import 'package:vinicius_eng_gruposbf_mobile/presentation/models/cart_card_model.dart';

abstract class CartState {}

class InitialCartState extends CartState {}

class SuccessCartState extends CartState {
  final List<CartCardModel> cart;

  SuccessCartState(this.cart);
}

class EmptyCartState extends CartState {
  final List<CartCardModel> cart = [];
}

class LoadingCartState extends CartState {}

class ErrorCartState extends CartState {
  final String message;
  ErrorCartState(this.message);
}
