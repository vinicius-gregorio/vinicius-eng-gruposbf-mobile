import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/entities/promotion.dart';
import 'package:vinicius_eng_gruposbf_mobile/presentation/states/home_state.dart';

import '../../config/app_log.dart';
import '../../domain/usecases/promotion/get_promotions_usecase.dart';

class HomeStore extends ValueNotifier<HomeState> {
  HomeStore() : super(InitialHomeState());

  Future getPromotions() async {
    value = LoadingHomeState();
    try {
      var service = GetIt.I.get<GetPromotionsUsecase>();
      var fold = await service();
      List<Promotion> promotions = fold.fold((l) => [], (r) => r);
      value = SuccessHomeState(promotions);
      appLog(promotions.toString());
    } catch (e) {
      value = ErrorHomeState(e.toString());
    }
  }
}
