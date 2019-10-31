import 'package:cranios/models/User.dart';


class News {
  int id;
  String header;
  String body;
  String headerImage;
  String image;
  User author;
  DateTime createdAt;
  DateTime updatedAt;

  News(this.id, this.header, this.body, this.headerImage, this.image, this.author, this.createdAt, this.updatedAt);

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      json['id'],
      json['header'],
      json['body'],
      json['headerImage'],
      json['image'],
      User.fromJson(json['author']),
      json['createdAt'],
      json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() => {
      'id': this.id,
      'header': this.header,
      'body': this.body,
      'headerImage': this.headerImage,
      'image': this.image,
      'author': this.author.toJson(),
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
  };
}
