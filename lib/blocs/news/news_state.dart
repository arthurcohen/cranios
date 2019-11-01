import 'package:cranios/models/News.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class NewsState extends Equatable {
  final List<News> news;

  NewsState(this.news, {List<dynamic> props = const <dynamic>[]}): super([news]..addAll(props));
}

class NewsLoading extends NewsState {
  NewsLoading(): super(null);
}

class NewsLoaded extends NewsState {
  NewsLoaded(news): super(news);
}

class NewsNotLoaded extends NewsState {
  NewsNotLoaded(): super(null);
}

class NewsErrorWhenLoading extends NewsState {
  NewsErrorWhenLoading(): super(null);
}
