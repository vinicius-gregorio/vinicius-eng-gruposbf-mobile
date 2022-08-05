import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/errors/cart_error.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/repositories/cart/cart_repository.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/get_cart_usecase.dart';

class CartRepositoryMock extends Mock implements CartRepository {}

class CartErrorMock extends Mock implements CartError {}

void main() {
  final repository = CartRepositoryMock();
  final usecase = GetCartUsecaseImpl(repository);
  test('should complete usecase', () {
    when(() => repository.getCart()).thenAnswer((_) async => right(<CartItem>[]));
    expect(usecase(), completes);
  });
  test('should return a cart list', () async {
    when(() => repository.getCart()).thenAnswer((_) async => right(<CartItem>[]));
    final result = await usecase();
    var fold = result.fold(
      (l) => left('expected a right'),
      (r) => r,
    );
    expect(fold, isA<List<CartItem>>());
  });
  test('should return right', () async {
    when(() => repository.getCart()).thenAnswer((_) async => right(<CartItem>[]));
    final result = await usecase();
    expect(result.isRight(), true);
  });

  test('should return left', () async {
    when(() => repository.getCart()).thenAnswer((_) async => left(CartErrorMock()));
    final result = await usecase();
    expect(result.isLeft(), true);
  });
  test('should return CartError', () async {
    when(() => repository.getCart()).thenAnswer((_) async => left(CartErrorMock()));
    final result = await usecase();
    var fold = result.fold(
      (l) => l,
      (r) => right('expected a left'),
    );
    expect(fold, isA<CartError>());
  });
}
