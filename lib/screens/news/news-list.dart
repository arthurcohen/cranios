import 'package:cranios/models/News.dart';
import 'package:cranios/screens/news/news-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    News customNews = News(
      0,
      'Nosso time chegou nas finais!!!',
      'Após vitória contra o boca juniors, o time do alecrim avanca na champion league',
      'http://placekitten.com/300/200',
      'http://placekitten.com/300/200',
      null,
      DateTime.now(),
      DateTime.now(),
    );

    List<NewsCard> newsList = [
      NewsCard(customNews),
      NewsCard(customNews),
      NewsCard(customNews),
    ];

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: newsList.length,
      itemBuilder: (BuildContext context, int index) {
        return newsList[index];
      },
    );
  }
}
