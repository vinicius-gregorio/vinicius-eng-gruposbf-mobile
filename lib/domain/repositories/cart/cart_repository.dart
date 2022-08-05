import 'package:dartz/dartz.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/errors/cart_error.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/typedefs/cart_typedefs.dart';

abstract class CartRepository {
  GetCartCall getCart();
  Future<Either<CartError, void>> addToCart(CartItem promotionId);
  Future<Either<CartError, void>> removeFromCart(String cartItemId);
  Future<Either<CartError, void>> removeSingleItemFromCart(String cartItemId);
  CheckoutCartCall checkoutCart(List<CartItem> cartItems);
  Future<Either<CartError, void>> cleanCart();
}
