import 'package:cranios/blocs/news/news_bloc.dart';
import 'package:cranios/blocs/news/news_event.dart';
import 'package:cranios/blocs/news/news_state.dart';
import 'package:cranios/screens/news/news-card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsBloc newsBloc = BlocProvider.of<NewsBloc>(context);

    if (newsBloc.currentState.runtimeType != NewsLoaded) {
      newsBloc.dispatch(LoadNews());
    }

    return BlocBuilder(
      bloc: newsBloc,
      builder: (context, NewsState state) {
        Widget child;

        switch (state.runtimeType) {
          case NewsNotLoaded:
            child = Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Não foi encontrada nenhuma notícia'),
                  RaisedButton(
                    child: Text('Tentar novamente'),
                    onPressed: () {
                      newsBloc.dispatch(LoadNews());
                    },
                  ),
                ],
              ),
            );
            break;
          case NewsLoaded:
            child = ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.news.length,
              itemBuilder: (BuildContext context, int index) {
                Widget item;
                if (state.runtimeType == ViewNewsDetails) {
                  item = Text(state.news[index].header);
                } else {
                  item = NewsCard(state.news[index]);
                }

                return item;
              },
            );
            break;
          case NewsErrorWhenLoading:
            child = Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Erro ao buscar notícias'),
                  RaisedButton(
                    child: Text('Tentar novamente'),
                    onPressed: () {
                      newsBloc.dispatch(LoadNews());
                    },
                  ),
                ],
              ),
            );
            break;
          case NewsLoading:
            child = Center(
              child: CircularProgressIndicator(),
            );
            break;
          default:
            child = Text('Erro');
        }

        return RefreshIndicator(
          child: child,
          onRefresh: () {
            return Future.microtask(() {
              newsBloc.dispatch(LoadNews());
            });
          },
        );
      },
    );
  }
}
