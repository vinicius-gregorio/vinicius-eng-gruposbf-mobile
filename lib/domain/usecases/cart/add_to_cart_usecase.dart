import 'package:dartz/dartz.dart';

import '../../errors/cart_error.dart';
import '../../repositories/cart/cart_repository.dart';

abstract class AddToCartUsecase {
  Future<Either<CartError, void>> call(String prmotionId);
}

class AddToCartUsecaseImpl implements AddToCartUsecase {
  final CartRepository repository;

  AddToCartUsecaseImpl(this.repository);

  @override
  Future<Either<CartError, void>> call(String prmotionId) async {
    return await repository.addToCart(prmotionId);
  }
}
