import '../../entities/cart_item.dart';
import '../../repositories/cart/cart_repository.dart';

abstract class AddToCartUsecase {
  Future<void> call(CartItem cart);
}

class AddToCartUsecaseImpl implements AddToCartUsecase {
  final CartRepository repository;

  AddToCartUsecaseImpl(this.repository);

  @override
  Future<void> call(CartItem cart) async {
    return await repository.addToCart(cart);
  }
}
