import 'package:vinicius_eng_gruposbf_mobile/domain/entities/promotion.dart';

class PromotionCardModel extends Promotion {
  PromotionCardModel(
      {required super.id,
      required super.name,
      required super.image,
      required super.price,
      required super.oldPrice,
      required super.rate,
      required super.reviews,
      required super.freeShipping,
      required super.discount,
      required super.colors});
}
