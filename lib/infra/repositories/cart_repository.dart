import 'package:vinicius_eng_gruposbf_mobile/domain/typedefs/cart_typedefs.dart';

import 'package:vinicius_eng_gruposbf_mobile/domain/errors/cart_error.dart';

import 'package:dartz/dartz.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/datasources/cart_datasource.dart';

import '../../domain/entities/cart_item.dart';
import '../../domain/repositories/cart/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartDatasource _cartDatasource;

  CartRepositoryImpl(this._cartDatasource);
  @override
  Future<Either<CartError, void>> addToCart(CartItem cartItem) async {
    try {
      await _cartDatasource.addToCart(cartItem);
      // ignore: void_checks
      return const Right('');
    } on CartError catch (e) {
      return Left(e);
    }
  }

  @override
  CheckoutCartCall checkoutCart(List<CartItem> cartItems) async {
    try {
      final response = await _cartDatasource.checkoutCart(cartItems);
      return Right(response);
    } on CartError catch (e) {
      return Left(e);
    }
  }

  @override
  GetCartCall getCart() async {
    try {
      final response = await _cartDatasource.getCart();
      return Right(response as List<String>);
    } on CartError catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CartError, void>> removeFromCart(String cartItemId) async {
    try {
      await _cartDatasource.removeFromCart(cartItemId);
      // ignore: void_checks
      return const Right('');
    } on CartError catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<CartError, void>> removeSingleItemFromCart(String cartItemId) async {
    try {
      await _cartDatasource.removeSingleItemFromCart(cartItemId);
      // ignore: void_checks
      return const Right('');
    } on CartError catch (e) {
      return Left(e);
    }
  }
}
