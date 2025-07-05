import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/app_extention.dart';
import 'package:news_app/features/newsArticles/modelView/cubit/news_articles_cubit.dart';
import 'package:news_app/features/newsArticles/modelView/cubit/news_articles_cubit_states.dart';
import 'package:news_app/features/newsArticles/view/widgets/news_card_widget.dart';
import 'package:news_app/features/newsSources/model/sources_model.dart';

class ArticlesView extends StatefulWidget {
  const ArticlesView({super.key, this.sources});
  final List<SourcesModel>? sources;

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  NewsArticlesCubit newsArticlesCubit = NewsArticlesCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => newsArticlesCubit,
      child: Expanded(
        child: TabBarView(
          children: [
            ...List.generate(
              widget.sources!.length,
              (tabindex) => TabContent(sourceId: widget.sources![tabindex].id!),
            ),
          ],
        ),
      ),
    );
  }
}

class TabContent extends StatefulWidget {
  const TabContent({super.key, this.sourceId});
  final String? sourceId;
  @override
  State<TabContent> createState() => _TabContentState();
}

class _TabContentState extends State<TabContent> {
  @override
  void initState() {
    super.initState();
    context.read<NewsArticlesCubit>().getNewsArticles(
      widget.sourceId!,
      context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsArticlesCubit, NewsArticlesCubitStates>(
      builder: (context, state) {
        switch (state) {
          case NewsArticlesInitialState():
          case NewsArticlesLoadingState():
            return Center(
              child: CircularProgressIndicator(
                color: context.getColor().secondaryHeaderColor,
              ),
            );
          case NewsArticlesFailureState():
            return Center(child: Text('${state.message}'));
          case NewsArticlesEmptyListState():
            return Center(
              child: Text(
                context.loc.noNewsAvailable,
                style: context.getTextStyle().labelLarge,
              ),
            );
          case NewsArticlesSucessState():
            return RefreshIndicator(
              onRefresh: () {
                return context.read<NewsArticlesCubit>().getNewsArticles(
                  widget.sourceId!,
                  context,
                );
              },
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16),
                padding: EdgeInsets.all(8),
                itemBuilder: (context, index) =>
                    NewsCardWidget(article: state.articles![index]),
                itemCount: state.articles!.length, //---------------
              ),
            );
        }
      },
    );
  }
}
