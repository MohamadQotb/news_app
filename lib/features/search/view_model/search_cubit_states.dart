import 'package:news_app/features/newsArticles/model/news_articles_model.dart';

sealed class SearchCubitStates {}

class SearchInitialState extends SearchCubitStates {}

class SearchLoadingState extends SearchCubitStates {}

class SearchFailureState extends SearchCubitStates {
  final String? message;

  SearchFailureState({required this.message});
}

class SearchNoDataState extends SearchCubitStates {
  final List<Articles> articles = [];
}

class SearchSuccessState extends SearchCubitStates {}

class GetMoreArticlesLoadingState extends SearchCubitStates {}
