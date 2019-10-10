import 'package:dio/dio.dart';

class LoginService {
  Dio dio = Dio(BaseOptions(
    baseUrl: "http://3.16.59.82:3000/users",
    connectTimeout: 2000,
    receiveTimeout: 2000
  ));

  Future<Response> login() {
    Future<Response> response = dio.post("/login", data: {'username': 'arthur', 'password': 'arthur'});
    return response;
  }
}
