import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';

class CartItemAdapter {
  static CartItem fromJson(dynamic data) {
    return CartItem(
      id: data['id'],
      quantity: data['quantity'],
    );
  }

  static Map<String, dynamic> toMap(CartItem item) {
    return {
      'id': item.id,
      'quantity': item.quantity,
    };
  }
}
