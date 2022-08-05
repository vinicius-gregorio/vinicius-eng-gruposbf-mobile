import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';

abstract class CartState {}

class InitialCartState extends CartState {}

class SuccessCartState extends CartState {
  final List<CartItem> cart;

  SuccessCartState(this.cart);
}

class EmptyCartState extends CartState {
  final List<CartItem> cart = [];
}

class LoadingCartState extends CartState {}

class ErrorCartState extends CartState {
  final String message;
  ErrorCartState(this.message);
}
