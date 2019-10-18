import 'package:dio/dio.dart';

class ServicesConfig {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://3.16.59.82",
      connectTimeout: 2000,
      receiveTimeout: 2000,
    ),
  );
}
