import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cranios/blocs/news/news_event.dart';
import 'package:cranios/blocs/news/news_state.dart';
import 'package:cranios/models/News.dart';
import 'package:cranios/services/news_service.dart';
import 'package:dio/dio.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsService newsService = NewsService();

  @override
  NewsState get initialState => NewsNotLoaded();

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    switch (event.runtimeType) {
      case LoadNews:
        yield NewsLoading();

        // await Future.delayed(Duration(seconds: 3));

        // News customNews = News(
        //   0,
        //   'Nosso time chegou nas finais!!!',
        //   'Após vitória contra o boca juniors, o time do alecrim avanca na champion league',
        //   'https://conteudo.imguol.com.br/2013/04/28/jogadores-do-audax-time-paulista-que-subiu-a-elite-do-estadual-1367173834338_615x300.jpg',
        //   'http://placekitten.com/200/300',
        //   null,
        //   DateTime.now(),
        //   DateTime.now(),
        // );

        // News customNews2 = News(
        //   0,
        //   'Nosso time chegou nas finais!!!',
        //   'Após vitória contra o boca juniors, o time do alecrim avanca na champion league',
        //   'http://www.futebolparanaense.net/images/noticias/4e9a13d8e9.jpg',
        //   'http://placekitten.com/700/1100',
        //   null,
        //   DateTime.now(),
        //   DateTime.now(),
        // );

        // if (Random().nextInt(2) == 0) {
        //   yield NewsLoaded([customNews, customNews2]);
        // } else {
        //   yield NewsErrorWhenLoading();
        // }

        Response newsResponse;
        try {
          newsResponse = await newsService.findAllNews();

          if (newsResponse.statusCode == HttpStatus.ok) {
            List<News> news =
                (newsResponse.data as List).map((n) => News.fromJson(n));

            yield NewsLoaded(news);
          } else if (newsResponse.statusCode == HttpStatus.notFound) {
            yield NewsNotLoaded();
          }
        } on DioError catch (e) {
          yield NewsErrorWhenLoading();
        }

        break;
    }
  }
}
