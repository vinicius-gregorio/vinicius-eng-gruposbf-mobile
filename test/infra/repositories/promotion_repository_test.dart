import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/promotion.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/errors/promotion_error.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/repositories/promotion/promotion_repository.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/datasources/promotion_datasource.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/repositories/promotion_repository.dart';

class PromotionDatasourceMock extends Mock implements PromotionDataSource {}

class PromotionErrorMock extends Mock implements PromotionError {}

void main() {
  final PromotionDataSource promotionDataSource = PromotionDatasourceMock();
  final PromotionRepository promotionRepository = PromotionRepositoryImpl(promotionDataSource);
  test('should return promotions', () async {
    when(() => promotionDataSource.getPromotions()).thenAnswer((_) async => promotionsJson);

    final action = await promotionRepository.getPromotions();
    final result = action.fold((l) => left('should return right'), (r) => r);
    expect(result, isA<List<Promotion>>());
  });

  test('should return the exact promotion', () async {
    when(() => promotionDataSource.getPromotions()).thenAnswer((_) async => promotionsJson);

    final action = await promotionRepository.getPromotions();
    final fold = action.fold((l) => left('should return right'), (r) => r);
    final result = fold as List;

    expect(result[0].name, 'Tênis Asics Gel-Dedicate 6 - Masculino');
  });
  test('should return PromotionError', () async {
    when(() => promotionDataSource.getPromotions())
        .thenAnswer((_) async => throw PromotionErrorMock());

    final action = await promotionRepository.getPromotions();
    final result = action.fold((l) => l, (r) => right('expected a left'));
    expect(result, isA<PromotionErrorMock>());
  });
}

final promotionsJson = jsonDecode(
    r'''  
[
  {
    "name": "Tênis Asics Gel-Dedicate 6 - Masculino",
    "image": "https://imgcentauro-a.akamaihd.net/250x250/9469584WA1/tenis-asics-gel-dedicate-6-masculino-img.jpg",
    "price": 566.83,
    "oldPrice": 687.76,
    "rate": 1,
    "reviews": 1053,
    "freeShipping": true,
    "discount": 82,
    "id": "34f7d111-f042-4a53-8dbb-9c64495a518e",
    "colors": 9
  },
  {
    "name": "Tênis Puma Wired - Infantil",
    "image": "https://imgcentauro-a.akamaihd.net/230x230/93227802.jpg",
    "price": 29.07,
    "oldPrice": 1462.97,
    "rate": 5,
    "reviews": 709,
    "freeShipping": false,
    "discount": 1,
    "id": "cde6dc63-3c11-43e9-a41f-beb7bc553d7a",
    "colors": 10
  },
  {
    "name": "Tênis Nike Air Zoom Pegasus 37 - Masculino",
    "image": "https://imgcentauro-a.akamaihd.net/230x230/949578BL.jpg",
    "price": 999.77,
    "oldPrice": 1583.68,
    "rate": 2,
    "reviews": 1093,
    "freeShipping": true,
    "discount": 63,
    "id": "e9e70eeb-ecc3-41a4-a177-26754679216f",
    "colors": 1
  },
  {
    "name": "Tênis New Balance ML501 - Masculino",
    "image": "https://imgcentauro-a.akamaihd.net/230x230/92344105.jpg",
    "price": 1622.04,
    "oldPrice": 1638.8,
    "rate": 4,
    "reviews": 402,
    "freeShipping": true,
    "discount": 98,
    "id": "8f90198e-a744-46ee-b52b-9ba4e19b2ef8",
    "colors": 5
  }]
''');
