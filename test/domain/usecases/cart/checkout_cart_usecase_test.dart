import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/errors/cart_error.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/repositories/cart/cart_repository.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/checkout_cart_usecase.dart';

class CartRepositoryMock extends Mock implements CartRepository {}

class CartErrorMock extends Mock implements CartError {}

void main() {
  final repository = CartRepositoryMock();
  final usecase = CheckoutCartUsecaseImpl(repository: repository);
  final httpResponse =
      Response(requestOptions: RequestOptions(method: 'POST', path: 'http://wwww.google.com'));
  test('should completes usecase', () {
    when(() => repository.checkoutCart(cartItems)).thenAnswer((_) async => right(httpResponse));
    expect(usecase(cartItems), completes);
  });

  test('should return anything', () async {
    when(() => repository.checkoutCart(cartItems)).thenAnswer((_) async => right(httpResponse));
    final result = await usecase(cartItems);
    final fold = result.fold(
      (l) => left('expected a right'),
      (r) => r,
    );
    expect(fold, 'anything');
  });

  test('should return CartError', () async {
    when(() => repository.checkoutCart(cartItems)).thenAnswer((_) async => left(CartErrorMock()));
    final result = await usecase(cartItems);
    final fold = result.fold(
      (l) => l,
      (r) => right('should return left'),
    );
    expect(fold, isA<CartError>());
  });
}

List<CartItem> cartItems = List.generate(
    4,
    (index) => CartItem(
        id: 'id',
        name: 'name',
        image: 'image',
        quantity: index,
        oldPrice: index * 0.32,
        price: index * 0.36));
