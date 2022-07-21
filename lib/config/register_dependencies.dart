import 'package:dio/dio.dart';
import 'package:vinicius_eng_gruposbf_mobile/config/app_log.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/repositories/promotion/promotion_repository.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/promotion/get_promotions_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/external/datasources/promotion_datasource.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/datasources/promotion_datasource.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/repositories/promotion_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> registerDependencies() async {
  GetIt getIt = GetIt.I;

  getIt.registerSingleton<Dio>(Dio());
  getIt.registerFactory<PromotionDataSource>(() => PromotionDatasourceImpl(getIt.get<Dio>()));

  getIt.registerFactory<PromotionRepository>(
      () => PromotionRepositoryImpl(getIt.get<PromotionDataSource>()));

  getIt.registerFactory<GetPromotionsUsecase>(
      () => GetPromotionsUsecaseImpl(getIt.get<PromotionRepository>()));

  getIt.allReady().then((value) => appLog('ready '));
}
