import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cranios/blocs/login/login_event.dart';
import 'package:cranios/blocs/login/login_state.dart';
import 'package:cranios/models/User.dart';
import 'dart:async';

import 'package:cranios/services/login_service.dart';
import 'package:dio/dio.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginService loginService = LoginService();

  @override
  LoginState get initialState => NotLoggedIn();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    print(event.runtimeType);
    switch (event.runtimeType) {
      case Authenticate:
        Response userResponse = await loginService.login();

        if (userResponse.statusCode == HttpStatus.ok) {
          User user = User.fromJson(userResponse.data);
          final String jwt = userResponse.headers.value('authorization');
          yield LoggedIn(user, jwt);
        } else {
          yield NotLoggedIn();
        }

        break;
      case Logout:
        yield NotLoggedIn();
        break;
    }
  }

}
