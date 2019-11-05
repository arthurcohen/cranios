import 'package:cranios/blocs/news/news_bloc.dart';
import 'package:cranios/blocs/news/news_event.dart';
import 'package:cranios/models/News.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCard extends StatelessWidget {
  final News newsData;

  NewsCard(this.newsData);

  @override
  Widget build(BuildContext context) {
    NewsBloc newsBloc = BlocProvider.of<NewsBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              child: Image.network(
                newsData.headerImage,
                fit: BoxFit.fitWidth,
              ),
            ),
            ListTile(
              title: Text(newsData.header),
              subtitle: Text(
                newsData.body,
                maxLines: 1,
              ),
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Ver mais'),
                  onPressed: () {
                    newsBloc.dispatch(ViewNewsDetails(this.newsData.id));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
