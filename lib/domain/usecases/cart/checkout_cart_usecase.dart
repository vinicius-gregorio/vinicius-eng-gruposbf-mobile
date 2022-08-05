import '../../entities/cart_item.dart';
import '../../repositories/cart/cart_repository.dart';
import '../../typedefs/cart_typedefs.dart';

abstract class CheckoutCartUsecase {
  CheckoutCartCall call(List<CartItem> cartItems);
}

class CheckoutCartUsecaseImpl implements CheckoutCartUsecase {
  final CartRepository repository;
  CheckoutCartUsecaseImpl({
    required this.repository,
  });

  @override
  CheckoutCartCall call(List<CartItem> cartItems) async {
    return repository.checkoutCart(cartItems);
  }
}
