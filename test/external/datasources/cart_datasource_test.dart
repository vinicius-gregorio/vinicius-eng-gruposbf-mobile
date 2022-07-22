import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinicius_eng_gruposbf_mobile/config/app_log.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/add_to_cart_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/checkout_cart_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/external/datasources/cart_datasource.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/repositories/cart_repository.dart';

void main() async {
  final Dio dio = Dio();
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final addToCartUsecase =
      AddToCartUsecaseImpl(CartRepositoryImpl(CartDatasourceImpl(dio, sharedPreferences)));
  test('should completes usecase', () {
    expect(addToCartUsecase('1'), completes);
  });

  test('should add to cart', () async {
    addToCartUsecase('2');
    List<String>? cart = sharedPreferences.getStringList('cart');
    String? id = cart?.last;
    appLog(id.toString());
    expect(id, '2');
    expect(id, isA<String>());
    expect(cart, isA<List<String>>());
  });
  test('should checkout cart', () async {
    final checkoutCartUsecase = CheckoutCartUsecaseImpl(
        repository: CartRepositoryImpl(CartDatasourceImpl(dio, sharedPreferences)));

    final response = await checkoutCartUsecase(cartItems);
    log(response.toString());
  });
}

List<CartItem> cartItems = [
  CartItem(id: '1', quantity: 2),
  CartItem(id: '2', quantity: 3),
];
