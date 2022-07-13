import 'package:vinicius_eng_gruposbf_mobile/domain/repositories/promotion/promotion_repository.dart';

import '../../entities/promotion.dart';

abstract class GetPromotionsUsecase {
  Future<List<Promotion>> call();
}

class GetPromotionsUsecaseImpl implements GetPromotionsUsecase {
  final PromotionRepository repository;

  GetPromotionsUsecaseImpl(this.repository);

  @override
  Future<List<Promotion>> call() async {
    return await repository.getPromotions();
  }
}
