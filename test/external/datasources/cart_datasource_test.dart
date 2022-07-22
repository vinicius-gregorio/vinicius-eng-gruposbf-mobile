import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinicius_eng_gruposbf_mobile/config/app_log.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/cart_item.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/add_to_cart_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/remove_single_item_from_cart.dart';
import 'package:vinicius_eng_gruposbf_mobile/external/datasources/cart_datasource.dart';
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
  test('should completes usecase', () {
    expect(addToCartUsecase(cartItem), completes);
  });

  test('should add to cart', () async {
    addToCartUsecase(cartItem);
    List<String>? cart = sharedPreferences.getStringList('cart');
    // String? id = cart?.last;
    // appLog(id.toString());
    // expect(id, '2');
    // expect(id, isA<String>());
    // expect(cart, isA<List<String>>());
    print(cart);
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

CartItem cartItem =
    CartItem(id: 'id', name: 'name', image: 'image', quantity: 7, oldPrice: 0.32, price: 0.36);
