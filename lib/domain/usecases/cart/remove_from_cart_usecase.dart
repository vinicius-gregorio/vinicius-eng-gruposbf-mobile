import 'package:dartz/dartz.dart';

import '../../errors/cart_error.dart';
import '../../repositories/cart/cart_repository.dart';

abstract class RemoveFromCartUsecase {
  Future<Either<CartError, void>> call(String cartItemId);
}

class RemoveFromCartUsecaseImpl implements RemoveFromCartUsecase {
  final CartRepository repository;

  RemoveFromCartUsecaseImpl(this.repository);

  @override
  Future<Either<CartError, void>> call(String cartItemId) async {
    return await repository.removeFromCart(cartItemId);
  }
}
