import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vinicius_eng_gruposbf_mobile/config/app_log.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/repositories/cart/cart_repository.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/repositories/promotion/promotion_repository.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/add_to_cart_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/checkout_cart_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/get_cart_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/remove_from_cart_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/cart/remove_single_item_from_cart.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/promotion/get_promotions_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/external/datasources/cart_datasource.dart';
import 'package:vinicius_eng_gruposbf_mobile/external/datasources/promotion_datasource.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/datasources/cart_datasource.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/datasources/promotion_datasource.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/repositories/cart_repository.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/repositories/promotion_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/stores/appbar_store.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/stores/cart_store.dart';

Future<void> registerDependencies() async {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingletonAsync<SharedPreferences>(SharedPreferences.getInstance);

  //promotion
  getIt.registerFactory<PromotionDataSource>(() => PromotionDatasourceImpl(getIt.get<Dio>()));
  getIt.registerFactory<PromotionRepository>(
      () => PromotionRepositoryImpl(getIt.get<PromotionDataSource>()));
  getIt.registerFactory<GetPromotionsUsecase>(
      () => GetPromotionsUsecaseImpl(getIt.get<PromotionRepository>()));

//cart
  getIt.registerFactory<CartDatasource>(
      () => CartDatasourceImpl(getIt.get<Dio>(), getIt.get<SharedPreferences>()));
  getIt.registerFactory<CartRepository>(() => CartRepositoryImpl(getIt.get<CartDatasource>()));
  getIt.registerFactory<GetCartUsecase>(() => GetCartUsecaseImpl(getIt.get<CartRepository>()));
  getIt.registerFactory<AddToCartUsecase>(() => AddToCartUsecaseImpl(getIt.get<CartRepository>()));
  getIt.registerFactory<CheckoutCartUsecase>(
      () => CheckoutCartUsecaseImpl(repository: getIt.get<CartRepository>()));
  getIt.registerFactory<RemoveFromCartUsecase>(
      () => RemoveFromCartUsecaseImpl(getIt.get<CartRepository>()));
  getIt.registerFactory<RemoveSingleItemFromCartUsecase>(
      () => RemoveSingleItemFromCartUsecaseImpl(getIt.get<CartRepository>()));

  //UI
  getIt.registerSingleton<AppBarStore>(AppBarStore());

  //completes
  getIt.allReady().then((value) => appLog('ready '));
}
