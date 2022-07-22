import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/errors/cart_error.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/adapters/cart_item_adapter.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/datasources/cart_datasource.dart';

class CartDatasourceImpl implements CartDatasource {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  CartDatasourceImpl(this.dio, this.sharedPreferences);

  @override
  Future<void> addToCart(CartItem cartItem) async {
    try {
      List<String>? cart = getCartSharedPreferences();
      String cartToAdd = CartItemAdapter().toLocalStorage(cartItem);

      if (cart == null) {
        sharedPreferences.setStringList('cart', [cartToAdd]);
      } else {
        sharedPreferences.setStringList('cart', [...cart, cartToAdd]);
      }
    } on DataSourceError catch (e) {
      throw DataSourceError(e.toString());
    }
  }

  @override
  Future<Response<ResponseBody>> checkoutCart(List<CartItem> cartItems) async {
    try {
      final items = cartItems.map((item) => CartItemAdapter.toMap(item)).toList();
      final response = await dio.post('http://10.0.2.2:3000/checkout', data: {
        "items": items,
      });
      log(response.data);
      return response.data;
    } on DataSourceError catch (e) {
      throw DataSourceError(e.toString());
    }
  }

  @override
  Future<List> getCart() async {
    try {
      List<String>? cart = getCartSharedPreferences();

      if (cart == null) {
        return [];
      } else {
        return cart;
      }
    } on DataSourceError catch (e) {
      throw DataSourceError(e.toString());
    }
  }

  @override
  Future<void> removeFromCart(String cartItemId) async {
    try {
      List<String>? cart = getCartSharedPreferences();
      if (cart == null) {
        return;
      } else {
        for (int i = 0; i < cart.length; i++) {
          if (cart[i] == cartItemId) {
            cart.removeAt(i);
          }
        }

        await sharedPreferences.setStringList('cart', cart);
      }
    } on DataSourceError catch (e) {
      throw DataSourceError(e.toString());
    }
  }

  @override
  Future<void> removeSingleItemFromCart(String cartItemId) async {
    try {
      List<String>? cart = getCartSharedPreferences();
      if (cart == null) {
        return;
      } else {
        cart.remove(cartItemId);

        await sharedPreferences.setStringList('cart', cart);
      }
    } on DataSourceError catch (e) {
      throw DataSourceError(e.toString());
    }
  }

  List<String>? getCartSharedPreferences() {
    List<String>? cart = sharedPreferences.getStringList('cart');
    return cart;
  }
}
