import 'package:dartz/dartz.dart';

import '../../errors/cart_error.dart';
import '../../repositories/cart/cart_repository.dart';

abstract class RemoveSingleItemFromCartUsecase {
  Future<Either<CartError, void>> call(String cartItemId);
}

class RemoveSingleItemFromCartUsecaseImpl implements RemoveSingleItemFromCartUsecase {
  final CartRepository repository;

  RemoveSingleItemFromCartUsecaseImpl(this.repository);

  @override
  Future<Either<CartError, void>> call(String cartItemId) async {
    return await repository.removeSingleItemFromCart(cartItemId);
  }
}
