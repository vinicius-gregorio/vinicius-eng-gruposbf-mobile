import 'package:dartz/dartz.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/errors/cart_error.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/repositories/cart/cart_repository.dart';

abstract class CleanCartUsecase {
  Future<Either<CartError, void>> call();
}

class CleanCartUsecaseImpl implements CleanCartUsecase {
  final CartRepository repository;

  CleanCartUsecaseImpl(this.repository);
  @override
  Future<Either<CartError, void>> call() async {
    return await repository.cleanCart();
  }
}
