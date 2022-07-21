import 'package:vinicius_eng_gruposbf_mobile/domain/repositories/cart/cart_repository.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/typedefs/cart_typedefs.dart';

abstract class GetCartUsecase {
  GetCartCall call();
}

class GetCartUsecaseImpl implements GetCartUsecase {
  final CartRepository repository;

  GetCartUsecaseImpl(this.repository);

  @override
  GetCartCall call() async {
    return await repository.getCart();
  }
}
