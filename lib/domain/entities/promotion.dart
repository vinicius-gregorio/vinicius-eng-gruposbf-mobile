class Promotion {
  String id;
  String name;
  String image;
  double price;
  double oldPrice;
  int rate;
  int reviews;
  bool freeShipping;
  int discount;
  int colors;

  Promotion({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.oldPrice,
    required this.rate,
    required this.reviews,
    required this.freeShipping,
    required this.discount,
    required this.colors,
  });
}
