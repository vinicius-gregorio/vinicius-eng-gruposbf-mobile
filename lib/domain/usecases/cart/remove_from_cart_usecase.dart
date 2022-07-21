import '../../repositories/cart/cart_repository.dart';

abstract class RemoveFromCartUsecase {
  Future<void> call(String cartItemId);
}

class RemoveFromCartUsecaseImpl implements RemoveFromCartUsecase {
  final CartRepository repository;

  RemoveFromCartUsecaseImpl(this.repository);

  @override
  Future<void> call(String cartItemId) async {
    return await repository.removeFromCart(cartItemId);
  }
}
