import 'package:dio/dio.dart';

class ServicesConfig {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://api.forcohen.com/cranios",
      connectTimeout: 2000,
      receiveTimeout: 2000,
    ),
  );
}
