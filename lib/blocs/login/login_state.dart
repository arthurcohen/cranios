import 'package:cranios/models/User.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginState extends Equatable {
  final User user;
  final String jwt;

  LoginState(this.user, this.jwt, {List<dynamic> props = const <dynamic>[]})
      : super([user, jwt]..addAll(props));
}

class LoggedIn extends LoginState {
  LoggedIn(user, jwt): super(user, jwt);
}

class WrongUserOrPass extends LoginState {
  WrongUserOrPass(): super(null, null);
}

class NotLoggedIn extends LoginState {
  NotLoggedIn(): super(null, null);
}
