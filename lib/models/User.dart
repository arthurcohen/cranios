import 'package:cranios/models/Transaction.dart';

class User {
  int id;
  String email;
  String username;
  String password;
  String name;
  String picture;
  String city;
  double participation;
  DateTime createdAt;
  DateTime updatedAt;
  bool admin;
  List<Transaction> transactions;

  double accountBalance() => this.transactions.isEmpty ? 0 : this.transactions.map((t) => t.value).reduce((a, b) => a + b);

  double lastTransactionValue() => this.transactions.isEmpty ? 0 : this.transactions.last.value;

  User(this.id, this.email, this.username, this.password, this.name, this.picture, this.city, this.participation, this.createdAt, this.updatedAt, this.admin, this.transactions);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['id'],
      json['email'],
      json['username'],
      json['password'],
      json['name'],
      json['picture'],
      json['city'],
      json['participation'],
      json['createdAt'],
      json['updatedAt'],
      json['admin'],
      (json['transactions'] as List).map((t) => Transaction.fromJson(t)).toList()
    );
  }

  Map<String, dynamic> toJson() => {
      'id': this.id,
      'email': this.email,
      'username': this.username,
      'password': this.password,
      'name': this.name,
      'picture': this.picture,
      'city': this.city,
      'participation': this.participation,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'admin': this.admin
  };
}
