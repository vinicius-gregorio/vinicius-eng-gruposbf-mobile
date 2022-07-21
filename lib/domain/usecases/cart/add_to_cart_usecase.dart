import 'package:dartz/dartz.dart';

import '../../entities/cart_item.dart';
import '../../errors/cart_error.dart';
import '../../repositories/cart/cart_repository.dart';

abstract class AddToCartUsecase {
  Future<Either<CartError, void>> call(CartItem cart);
}

class AddToCartUsecaseImpl implements AddToCartUsecase {
  final CartRepository repository;

  AddToCartUsecaseImpl(this.repository);

  @override
  Future<Either<CartError, void>> call(CartItem cart) async {
    return await repository.addToCart(cart);
  }
}
