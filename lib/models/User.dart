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

  

  User(this.id, this.email, this.username, this.password, this.name, this.picture, this.city, this.participation, this.createdAt, this.updatedAt, this.admin);

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
      json['admin']
    );
  }

  Map<String, dynamic>toJson() => {
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
