import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/promotion.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/promotion/get_promotions_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/external/datasources/promotion_datasource.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/repositories/promotion_repository.dart';

void main() {
  final usecase = GetPromotionsUsecaseImpl(PromotionRepositoryImpl(PromotionDatasourceImpl(Dio())));
  test('should complete request', () {
    expect(usecase(), completes);
  });

  //this test will only work after the server is running AND the server is running on the same machine as the test

  // test('should return a list of promotions', () async {
  //   final response = await usecase();
  //   final result = response.fold((l) => l, (r) => r);
  //   expect(result, isA<List<Promotion>>());
  // });
}
