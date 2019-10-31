import 'package:cranios/models/News.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  News newsData;

  NewsCard(this.newsData);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 200,
              child: Image.network(
                newsData.image,
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
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
