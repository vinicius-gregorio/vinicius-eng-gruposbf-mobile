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
      List<CartItem> cartModel = cart == null ? [] : CartItemAdapter.fromLocalStorage(cart);

      if (cart == null || cart.isEmpty) {
        sharedPreferences.setStringList('cart', [cartToAdd]);
      } else if (cartModel.map((e) => e.id).contains(cartItem.id)) {
        for (int i = 0; i < cartModel.length; i++) {
          CartItem item = cartModel[i];
          if (cartItem.id == item.id) {
            cartModel[i].quantity += 1;
          }
        }

        List<String> newCart = [];
        // ignore: avoid_function_literals_in_foreach_calls
        cartModel.forEach((element) {
          newCart.add(CartItemAdapter().toLocalStorage(element));
        });

        sharedPreferences.setStringList('cart', newCart);
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
      final response = await dio.post('http://10.0.2.2:3000/cart', data: {
        "items": items,
      });
      if (response.statusCode == 201 || response.statusCode == 200) {
        sharedPreferences.setStringList('cart', []);
      }
      if (response.statusCode == 500) {
        throw DataSourceError('Server error');
      }
      return response.data;
    } on DataSourceError catch (e) {
      throw DataSourceError(e.toString());
    }
  }

  @override
  Future<List<CartItem>> getCart() async {
    try {
      List<String>? cart = getCartSharedPreferences();

      if (cart == null || cart.isEmpty) {
        return [];
      } else {
        return CartItemAdapter.fromLocalStorage(cart);
      }
    } on DataSourceError catch (e) {
      throw DataSourceError(e.toString());
    }
  }

  @override
  Future<void> removeFromCart(String cartItemId) async {
    try {
      List<String>? cart = getCartSharedPreferences();
      List<CartItem> cartModel = cart == null ? [] : CartItemAdapter.fromLocalStorage(cart);

      if (cart == null) {
        return;
      } else {
        for (int i = 0; i < cartModel.length; i++) {
          CartItem item = cartModel[i];
          if (cartItemId == item.id) {
            cartModel.removeAt(i);
          }
        }
        cart.remove(cartItemId);
        List<String> newCart = [];
        // ignore: avoid_function_literals_in_foreach_calls
        cartModel.forEach((element) {
          newCart.add(CartItemAdapter().toLocalStorage(element));
        });

        sharedPreferences.setStringList('cart', newCart);
      }
    } on DataSourceError catch (e) {
      throw DataSourceError(e.toString());
    }
  }

  @override
  Future<void> removeSingleItemFromCart(String cartItemId) async {
    try {
      List<String>? cart = getCartSharedPreferences();
      List<CartItem> cartModel = cart == null ? [] : CartItemAdapter.fromLocalStorage(cart);

      if (cart == null) {
        return;
      } else {
        for (int i = 0; i < cartModel.length; i++) {
          CartItem item = cartModel[i];
          if (cartItemId == item.id) {
            if (item.quantity > 1) {
              cartModel[i].quantity -= 1;
            } else {
              cartModel.removeAt(i);
            }
          }
        }
        cart.remove(cartItemId);
        List<String> newCart = [];
        // ignore: avoid_function_literals_in_foreach_calls
        cartModel.forEach((element) {
          newCart.add(CartItemAdapter().toLocalStorage(element));
        });

        sharedPreferences.setStringList('cart', newCart);
      }
    } on DataSourceError catch (e) {
      throw DataSourceError(e.toString());
    }
  }

  @override
  Future<void> cleanCart() async {
    sharedPreferences.setStringList('cart', []);
  }

  List<String>? getCartSharedPreferences() {
    List<String>? cart = sharedPreferences.getStringList('cart');
    return cart;
  }
}
