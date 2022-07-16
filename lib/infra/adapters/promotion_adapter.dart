import '../../domain/entities/promotion.dart';

class PromotionAdapter {
  static Promotion fromJson(dynamic data) {
    return Promotion(
        id: data['id'],
        name: data['name'],
        image: data['image'],
        price: data['price'],
        oldPrice: data['oldPrice'],
        rate: data['rate'],
        reviews: data['reviews'],
        freeShipping: data['freeShipping'],
        discount: data['discount'],
        colors: data['colors']);
  }
}
