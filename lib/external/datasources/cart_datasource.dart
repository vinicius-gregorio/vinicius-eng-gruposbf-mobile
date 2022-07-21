import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinicius_eng_gruposbf_mobile/config/app_log.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';

import '../../domain/errors/cart_error.dart';
import '../../infra/datasources/cart_datasource.dart';

class CartDatasourceImpl implements CartDatasource {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  CartDatasourceImpl(this.dio, this.sharedPreferences);

  @override
  Future<void> addToCart(String promotionId) async {
    try {
      List<String>? cart = sharedPreferences.getStringList('cart');
      if (cart == null) {
        sharedPreferences.setStringList('cart', [promotionId]);
      } else {
        sharedPreferences.setStringList('cart', [...cart, promotionId]);
      }
    } catch (e) {
      appLog(e.toString());
      throw DataSourceError(e.toString());
    }
  }

  @override
  Future checkoutCart() async {
    try {
      final response = await dio.post('http://10.0.2.2:3000/checkout', data: {});
      return response.data;
    } catch (e) {
      appLog(e.toString());
      throw DataSourceError(e.toString());
    }
  }

  @override
  Future<List> getCart() {
    // TODO: implement getCart
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromCart(String cartItemId) {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }
}
