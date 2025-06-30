import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/newsArticles/model/news_articles_api.dart';
import 'package:news_app/features/newsArticles/model/news_articles_model.dart';
import 'package:news_app/features/newsArticles/modelView/cubit/news_articles_cubit_states.dart';

class NewsArticlesCubit extends Cubit<NewsArticlesCubitStates> {
  NewsArticlesCubit() : super(NewsArticlesInitialState());
  getNewsArticles(String sourceID) async {
    emit(NewsArticlesLoadingState());
    try {
      List<Articles>? articles = await NewsArticlesApi.getNewsArticles(
        sourceID,
      );
      if (articles == null || articles.isEmpty) {
        emit(NewsArticlesEmptyListState());
        return;
      }
      emit(NewsArticlesSucessState(articles: articles));
    } catch (e) {
      emit(NewsArticlesFailureState(message: e.toString()));
    }
  }
}
