import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/errors/cart_error.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/repositories/cart/cart_repository.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/checkout_cart_usecase.dart';

class CartRepositoryMock extends Mock implements CartRepository {}

class CartErrorMock extends Mock implements CartError {}

void main() {
  final repository = CartRepositoryMock();
  final usecase = CheckoutCartUsecaseImpl(repository: repository);

  test('should completes usecase', () {
    when(() => repository.checkoutCart()).thenAnswer((_) async => right({}));
    expect(usecase(), completes);
  });

  test('should return anything', () async {
    when(() => repository.checkoutCart()).thenAnswer((_) async => right('anything'));
    final result = await usecase();
    final fold = result.fold(
      (l) => left('expected a right'),
      (r) => r,
    );
    expect(fold, 'anything');
  });

  test('should return CartError', () async {
    when(() => repository.checkoutCart()).thenAnswer((_) async => left(CartErrorMock()));
    final result = await usecase();
    final fold = result.fold(
      (l) => l,
      (r) => right('should return left'),
    );
    expect(fold, isA<CartError>());
  });
}