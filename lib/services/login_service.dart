import 'package:cranios/services/services_config.dart';
import 'package:dio/dio.dart';

class LoginService {
  Dio dio = ServicesConfig.dio;

  Future<Response> login() {
    Future<Response> response = dio.post("/users/login", data: {'username': 'arthur', 'password': 'arthur'});
    return response;
  }
}
