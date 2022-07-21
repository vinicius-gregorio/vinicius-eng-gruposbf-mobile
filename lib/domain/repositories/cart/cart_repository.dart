import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/typedefs/cart_typedefs.dart';

abstract class CartRepository {
  GetCartCall getCart();
  Future<void> addToCart(CartItem cart);
  Future<void> removeFromCart(String cartItemId);
  CheckoutCartCall checkoutCart();
}
