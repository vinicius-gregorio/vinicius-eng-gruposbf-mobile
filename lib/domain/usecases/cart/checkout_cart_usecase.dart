import '../../repositories/cart/cart_repository.dart';
import '../../typedefs/cart_typedefs.dart';

abstract class CheckoutCartUsecase {
  CheckoutCartCall call();
}

class CheckoutCartUsecaseImpl implements CheckoutCartUsecase {
  final CartRepository repository;
  CheckoutCartUsecaseImpl({
    required this.repository,
  });

  @override
  CheckoutCartCall call() async {
    return repository.checkoutCart();
  }
}
