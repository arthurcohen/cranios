import 'dart:io';

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

        Response newsResponse;
        try {
          newsResponse = await newsService.findAllNews();

          if (newsResponse.statusCode == HttpStatus.ok) {
            List<News> news =
                (newsResponse.data as List).map((n) => News.fromJson(n)).toList();

            yield NewsLoaded(news);
          } else if (newsResponse.statusCode == HttpStatus.notFound) {
            yield NewsNotLoaded();
          }
        } on DioError catch (e) {
          print(e);
          yield NewsErrorWhenLoading();
        } catch (e) {
          print(e);
          yield NewsErrorWhenLoading();
        }

        break;
      case ViewNewsDetails:
        int newsId = (event as ViewNewsDetails).id;
        if (this.currentState.news[newsId] != null) {
          yield NewsDetail(newsId, this.currentState.news);
        }
        break;
    }
  }
}
