import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]): super(props);
}

class Authenticate extends LoginEvent {
  final String username;
  final String password;

  Authenticate(this.username, this.password): super([username, password]);
}

class Logout extends LoginEvent {
  Logout(): super([]);
}
