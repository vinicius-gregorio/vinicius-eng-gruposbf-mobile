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

  static List<CartItem> fromLocalStorage(List<String> data) {
    List<CartItem> cartItems = [];
    data.forEach((item) {
      List<String> itemData = item.split('-');
      cartItems.add(CartItem(
        id: itemData[0],
        name: itemData[1],
        image: itemData[2],
        quantity: int.parse(itemData[3]),
        oldPrice: double.parse(itemData[4]),
        price: double.parse(itemData[5]),
      ));
    });
    return cartItems;
  }
}
