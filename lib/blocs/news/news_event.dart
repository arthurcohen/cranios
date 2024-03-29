import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class NewsEvent extends Equatable {
  NewsEvent([List props = const []]): super(props);
}

class LoadNews extends NewsEvent {}

class ViewNewsDetails extends NewsEvent {
  final int id;

  ViewNewsDetails(this.id): super();
}
