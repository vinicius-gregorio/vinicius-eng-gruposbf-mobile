import 'package:vinicius_eng_gruposbf_mobile/domain/entities/promotion.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final List<Promotion> promotions;

  SuccessHomeState(this.promotions);
}

class LoadingHomeState extends HomeState {}

class ErrorHomeState extends HomeState {
  final String message;

  ErrorHomeState(this.message);
}
