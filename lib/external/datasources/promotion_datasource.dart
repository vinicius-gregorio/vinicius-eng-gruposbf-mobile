import 'package:dio/dio.dart';
import 'package:vinicius_eng_gruposbf_mobile/config/app_log.dart';

import 'package:vinicius_eng_gruposbf_mobile/domain/errors/promotion_error.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/datasources/promotion_datasource.dart';

class PromotionDatasourceImpl implements PromotionDataSource {
  final Dio dio;
  PromotionDatasourceImpl(this.dio);
  @override
  Future<List> getPromotions() async {
    //TODO: implement HttpClient
    //TODO: implement env variables;
    try {
      final response = await dio.get('http://10.0.2.2:3000/promotions');
      return response.data;
    } catch (e) {
      appLog(e.toString());
      throw DataSourceError(e.toString());
    }
  }
}
