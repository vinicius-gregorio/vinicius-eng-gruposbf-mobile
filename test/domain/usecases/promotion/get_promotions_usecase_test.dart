import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/promotion.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/errors/promotion_error.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/repositories/promotion/promotion_repository.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/usecases/promotion/get_promotions_usecase.dart';

class PromotionRepositoryMock extends Mock implements PromotionRepository {}

class PromotionErrorMock extends Mock implements PromotionError {}

void main() {
  final repository = PromotionRepositoryMock();
  final usecase = GetPromotionsUsecaseImpl(repository);

  test('should completes usecase', () {
    when(() => repository.getPromotions()).thenAnswer((_) async => right(<Promotion>[]));
    expect(usecase(), completes);
  });
  test('should return a promotions list', () async {
    when(() => repository.getPromotions()).thenAnswer((_) async => right(<Promotion>[]));
    final result = await usecase();
    var fold = result.fold(
      (l) => fail('expected a right'),
      (r) => r,
    );
    expect(fold, isA<List<Promotion>>());
  });

  test('should return right', () async {
    when(() => repository.getPromotions()).thenAnswer((_) async => right(<Promotion>[]));
    final result = await usecase();

    expect(result.isRight(), true);
  });
  test('should return PromotionError', () async {
    when(() => repository.getPromotions()).thenAnswer((_) async => left(PromotionErrorMock()));
    final result = await usecase();
    var fold = result.fold(
      (l) => l,
      (r) => right('expected a left'),
    );
    expect(fold, isA<PromotionError>());
  });

  test('should return left', () async {
    when(() => repository.getPromotions()).thenAnswer((_) async => left(PromotionErrorMock()));
    final result = await usecase();

    expect(result.isLeft(), true);
  });
}
