import '../../domain/entities/cart_item.dart';

abstract class CartDatasource {
  Future<List> getCart();
  Future<void> addToCart(String promotionId);
  Future<void> removeFromCart(String cartItemId);
  Future checkoutCart();
}
