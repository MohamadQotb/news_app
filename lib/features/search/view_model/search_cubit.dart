import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/newsArticles/model/news_articles_model.dart';
import 'package:news_app/features/search/model/search_api.dart';
import 'package:news_app/features/search/view_model/search_cubit_states.dart';

class SearchCubit extends Cubit<SearchCubitStates> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  int page = 1;
  List<Articles> articles = [];
  SearchCubit() : super(SearchInitialState()) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool atTop = scrollController.position.pixels == 0;
        if (!atTop && state is! GetMoreArticlesLoadingState) {
          page++;
          emit(GetMoreArticlesLoadingState());
          getSearchedArticles();
        }
      }
    });
  }
  getSearchedArticles() async {
    if (articles.isEmpty) {
      emit(SearchLoadingState());
    }
    try {
      List<Articles> newArticles =
          await SearchApi.getsearchedArticles(controller.text, page) ?? [];
      articles.addAll(newArticles);
      if (articles.isEmpty) {
        emit(SearchNoDataState());

        return;
      }

      emit(SearchSuccessState());
    } catch (e) {
      emit(
        SearchFailureState(
          message: e.toString() == 'Null check operator used on a null value'
              ? 'please write something in Search field!'
              : e.toString(),
        ),
      );
    }
  }
}
