import 'package:dio/dio.dart';
import 'package:vinicius_eng_gruposbf_mobile/domain/errors/promotion_error.dart';
import 'package:vinicius_eng_gruposbf_mobile/infra/datasources/promotion_datasource.dart';

class PromotionDatasourceImpl implements PromotionDataSource {
  @override
  Future<List> getPromotions() async {
    //TODO: implement HttpClient
    //TODO: implement env variables;
    try {
      final response = await Dio().get('http://localhost:3000/promotions');
      return response.data;
    } catch (e) {
      throw DataSourceError(e.toString());
    }
  }
}
