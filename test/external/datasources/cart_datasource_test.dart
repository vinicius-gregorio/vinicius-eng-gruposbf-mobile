import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/add_to_cart_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/get_cart_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/remove_single_item_from_cart.dart';
import 'package:vinicius_eng_gruposbf_mobile/external/datasources/cart_datasource.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/adapters/cart_item_adapter.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/repositories/cart_repository.dart';

void main() async {
  final Dio dio = Dio();
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final addToCartUsecase =
      AddToCartUsecaseImpl(CartRepositoryImpl(CartDatasourceImpl(dio, sharedPreferences)));

  final removeFromCartUsecase = RemoveSingleItemFromCartUsecaseImpl(
      CartRepositoryImpl(CartDatasourceImpl(dio, sharedPreferences)));
  final removeSingleItemFromCartUsecase = RemoveSingleItemFromCartUsecaseImpl(
      CartRepositoryImpl(CartDatasourceImpl(dio, sharedPreferences)));
  final getCartUsecase =
      GetCartUsecaseImpl(CartRepositoryImpl(CartDatasourceImpl(dio, sharedPreferences)));
  test('should completes usecase', () async {
    expect(await addToCartUsecase(cartItem), isA<Right>());
  });

  test('should add to cart', () async {
    await addToCartUsecase(cartItem);

    List<String>? cart = sharedPreferences.getStringList('cart');
    List<CartItem> cartModel = cart == null ? [] : CartItemAdapter.fromLocalStorage(cart);

    final find = cartModel.firstWhere((element) => element.id == cartItem.id);

    expect(cart, isA<List<String>>());
    expect(cartModel, isA<List<CartItem>>());
    expect(find, isA<CartItem>());
  });

  test('should remove item from cart', () async {
    String cartItemId = '57';
    List<String>? cart = sharedPreferences.getStringList('cart');

    await addToCartUsecase(cartItem).then((value) => removeFromCartUsecase(cartItemId));

    expect(cart, isA<List<String>>());
    expect(cart, isNotNull);
    expect(cart, isNot(contains(cartItemId)));
  });

  test('should remove single item from cart', () async {
    String cartItemId = '57';
    List<String>? cart = sharedPreferences.getStringList('cart');

    await addToCartUsecase(cartItem).then((value) => removeSingleItemFromCartUsecase(cartItemId));
    int cartItemIdQuantity = cart!.where((item) => item == cartItemId).length;

    expect(cart, isA<List<String>>());
    expect(cartItemIdQuantity, isNotNull);
    expect(cartItemIdQuantity, 0);
  });

  test('should get cart', () async {
    List<String>? cart = sharedPreferences.getStringList('cart');
    final result = await getCartUsecase();
    final cartItems = result.fold((l) => left('should return right'), (r) => r);
    expect(cart, isA<List<String>>());
    expect(cartItems, isA<List<CartItem>>());
    expect(cart, isNotNull);
  });
}

CartItem cartItem = CartItem(
  id: 'fasf3asfasd',
  name: 'asdasdasd',
  image: 'asdsadsad',
  quantity: 7,
  oldPrice: 2.32,
  price: 3.36,
);
