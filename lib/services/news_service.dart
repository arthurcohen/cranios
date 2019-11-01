import 'package:cranios/models/News.dart';
import 'package:cranios/services/services_config.dart';
import 'package:dio/dio.dart';

class NewsService {
  Dio dio = ServicesConfig.dio;

  Future<Response> findAllNews() {
    Future<Response> response = dio.get('/news');

    return response;
  }
}
