import '../../repositories/promotion/promotion_repository.dart';
import '../../typedefs/get_promotion_typedef.dart';

abstract class GetPromotionsUsecase {
  GetPromotionsCall call();
}

class GetPromotionsUsecaseImpl implements GetPromotionsUsecase {
  final PromotionRepository repository;

  GetPromotionsUsecaseImpl(this.repository);

  @override
  GetPromotionsCall call() async {
    return await repository.getPromotions();
  }
}
