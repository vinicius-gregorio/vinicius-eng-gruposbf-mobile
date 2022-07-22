import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';

class CartItemAdapter {
  static Map<String, dynamic> toMap(CartItem item) {
    return {
      'id': item.id,
      'quantity': item.quantity,
    };
  }

  String toLocalStorage(CartItem cartItem) {
    return '${cartItem.id}-${cartItem.name}-${cartItem.image}-${cartItem.quantity}-${cartItem.oldPrice}-${cartItem.price}';
    // return 'CartItem(id: $id, name: $name, image: $image, quantity: $quantity, oldPrice: $oldPrice, price: $price)';
  }
}
