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
  Future<Either<CartError, void>> addToCart(String promotionId) async {
    try {
      await _cartDatasource.addToCart(promotionId);
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
      return response.fold((l) => l, (r) => r);
    } catch (e, stackTrace) {
      return Left(DataSourceError(e.toString(), stackTrace));
    }
  }

  @override
  GetCartCall getCart() {
    // TODO: implement getCart
    throw UnimplementedError();
  }

  @override
  Future<Either<CartError, void>> removeFromCart(String cartItemId) {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }
}
