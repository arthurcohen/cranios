import 'package:cranios/models/News.dart';
import 'package:cranios/services/services_config.dart';
import 'package:dio/dio.dart';

class NewsService {
  // Dio dio = ServicesConfig.dio;
  Dio dio = new Dio(
    BaseOptions(baseUrl: 'http://www.mocky.io/v2/5dc0bff33300008c001a4d07'),
  );

  Future<Response> findAllNews() {
    // Future<Response> response = dio.get('/news');
    Future<Response> response = dio.get('/');

    return response;
  }
}
