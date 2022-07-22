import 'package:dio/dio.dart';

import '../../domain/entities/cart_item.dart';

abstract class CartDatasource {
  Future<List> getCart();
  Future<void> addToCart(CartItem cartItem);
  Future<void> removeFromCart(String cartItemId);
  Future<void> removeSingleItemFromCart(String cartItemId);
  Future<Response> checkoutCart(List<CartItem> cartItems);
}
