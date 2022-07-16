import 'package:flutter_test/flutter_test.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/promotion.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/promotion/get_promotions_usecase.dart';
import 'package:vinicius_eng_gruposbf_mobile/external/datasources/promotion_datasource.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/repositories/promotion_repository.dart';

void main() {
  final usecase = GetPromotionsUsecaseImpl(PromotionRepositoryImpl(PromotionDatasourceImpl()));
  test('should complete request', () {
    expect(usecase(), completes);
  });

  test('should return a list of promotions', () async {
    final response = await usecase();
    final result = response.fold((l) => l, (r) => r);
    expect(result, isA<List<Promotion>>());
  });
}
