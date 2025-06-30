import 'package:news_app/features/newsArticles/model/news_articles_model.dart';

sealed class NewsArticlesCubitStates {}

class NewsArticlesInitialState extends NewsArticlesCubitStates {}

class NewsArticlesLoadingState extends NewsArticlesCubitStates {}

class NewsArticlesFailureState extends NewsArticlesCubitStates {
  final String? message;

  NewsArticlesFailureState({required this.message});
}

class NewsArticlesSucessState extends NewsArticlesCubitStates {
  final List<Articles>? articles;

  NewsArticlesSucessState({required this.articles});
}

class NewsArticlesEmptyListState extends NewsArticlesCubitStates {}
