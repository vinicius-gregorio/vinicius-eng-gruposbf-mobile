import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/errors/cart_error.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/datasources/cart_datasource.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/repositories/cart_repository.dart';

class CartDatasourceMock extends Mock implements CartDatasource {}

class CartErrorMock extends Mock implements CartError {}

void main() {
  final cartDatasource = CartDatasourceMock();
  final cartRepository = CartRepositoryImpl(cartDatasource);
  test('should completes add to cart', () {
    const String cartItemId = 'cartItemId';
    final cart = [cartItemId];
    when(() => cartDatasource.addToCart(cartItem)).thenAnswer((_) async => cart);
    expect(cartDatasource.addToCart(cartItem), completion(cart));
  });

  // test('should returns cart error', () async {
  //   when(() => cartRepository.addToCart(cartItem)).thenAnswer((_) async => left(CartErrorMock()));
  //   final action = await cartRepository.addToCart(cartItem);
  //   final result = action.fold((l) => l, (r) => right('should return left'));
  //   expect(result, isA<CartErrorMock>());
  // });

  test('should call remove from cart with no errors', () async {
    const String cartItemId = 'id1';
    when(() => cartDatasource.removeFromCart(cartItemId)).thenAnswer((_) async => const Right(''));
    final response = await cartRepository.removeFromCart(cartItemId);
    expect(response, isNot(isA<CartErrorMock>()));
  });

  test('should return error from  remove from cart ', () async {
    const String cartItemId = 'id1';
    when(() => cartDatasource.removeFromCart(cartItemId))
        .thenAnswer((_) async => throw CartErrorMock());
    final response = await cartRepository.removeFromCart(cartItemId);
    final fold = response.fold((l) => l, (r) => right('should return left'));
    expect(fold, isA<CartErrorMock>());
  });

  test('should remove item quantity from cart', () {
    const String cartItemId = 'cartItemId';
    final cart = [cartItemId];
    when(() => cartDatasource.removeSingleItemFromCart(cartItemId)).thenAnswer((_) async => cart);
    expect(cartDatasource.removeSingleItemFromCart(cartItemId), completion(cart));
  });

  test('should return error from  remove item quantity from cart', () async {
    const String cartItemId = 'cartItemId';
    final cart = [cartItemId];
    when(() => cartDatasource.removeSingleItemFromCart(cartItemId))
        .thenAnswer((_) async => throw CartErrorMock());
    final response = await cartRepository.removeSingleItemFromCart(cartItemId);
    final fold = response.fold((l) => l, (r) => right('should return left'));
    expect(fold, isA<CartErrorMock>());
  });
}

CartItem cartItem =
    CartItem(id: 'id', name: 'name', image: 'image', quantity: 7, oldPrice: 0.32, price: 0.36);

List<CartItem> cart = List.generate(
    4,
    (index) => CartItem(
        id: 'id$index', name: 'name', image: 'image', quantity: 7, oldPrice: 0.32, price: 0.36));
