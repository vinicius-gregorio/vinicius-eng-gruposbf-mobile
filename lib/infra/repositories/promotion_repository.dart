import 'package:dartz/dartz.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/errors/promotion_error.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/repositories/promotion/promotion_repository.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/typedefs/get_promotion_typedef.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/datasources/promotion_datasource.dart';

import '../adapters/promotion_adapter.dart';

class PromotionRepositoryImpl extends PromotionRepository {
  final PromotionDataSource _promotionDataSource;
  PromotionRepositoryImpl(this._promotionDataSource);

  @override
  GetPromotionsCall getPromotions() async {
    try {
      final data = await _promotionDataSource.getPromotions();
      final promotions = data.map((e) => PromotionAdapter.fromJson(e)).toList();
      return Right(promotions);
    } on PromotionError catch (e) {
      return Left(e);
    }
  }
}
