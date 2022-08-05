class CartCardModel {
  String id;
  String name;
  String image;
  int quantity;
  double oldPrice;
  double price;
  CartCardModel({
    required this.id,
    required this.name,
    required this.image,
    required this.quantity,
    required this.oldPrice,
    required this.price,
  });
}
