import 'package:dartz/dartz.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';

import '../../errors/cart_error.dart';
import '../../repositories/cart/cart_repository.dart';

abstract class AddToCartUsecase {
  Future<Either<CartError, void>> call(CartItem cartItem);
}

class AddToCartUsecaseImpl implements AddToCartUsecase {
  final CartRepository repository;

  AddToCartUsecaseImpl(this.repository);

  @override
  Future<Either<CartError, void>> call(CartItem cartItem) async {
    return await repository.addToCart(cartItem);
  }
}
