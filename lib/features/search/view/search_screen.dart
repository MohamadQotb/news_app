import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/app_extention.dart';
import 'package:news_app/features/newsArticles/model/news_articles_model.dart';
import 'package:news_app/features/newsArticles/view/widgets/news_card_widget.dart';
import 'package:news_app/features/search/view/widgets/custome_search_bar.dart';
import 'package:news_app/features/search/view_model/search_cubit.dart';
import 'package:news_app/features/search/view_model/search_cubit_states.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = '/search-screen';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: CustomScrollView(
          controller: context.read<SearchCubit>().scrollController,

          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              floating: true,
              elevation: 0,

              toolbarHeight: 80,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CustomeSearchBar(),
              ),
            ),
            BlocBuilder<SearchCubit, SearchCubitStates>(
              builder: (context, state) {
                switch (state) {
                  case SearchInitialState():
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'No News Available!',
                          style: context.getTextStyle().bodyMedium,
                        ),
                      ),
                    );

                  case SearchLoadingState():
                    return SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(
                          color: context.getColor().secondaryHeaderColor,
                        ),
                      ),
                    );
                  case SearchFailureState():
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          '${state.message}',
                          style: context.getTextStyle().bodyMedium,
                        ),
                      ),
                    );
                  case SearchNoDataState():
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Text(
                          'No News Available!',
                          style: context.getTextStyle().bodyMedium,
                        ),
                      ),
                    );
                  case GetMoreArticlesLoadingState():
                  case SearchSuccessState():
                    final List<Articles> articles = context
                        .watch<SearchCubit>()
                        .articles;

                    return SliverList.separated(
                      itemCount:
                          articles.length +
                          (state is GetMoreArticlesLoadingState ? 1 : 0),

                      itemBuilder: (context, index) {
                        if (state is GetMoreArticlesLoadingState &&
                            index == articles.length) {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: context.getColor().secondaryHeaderColor,
                              ),
                            ),
                          );
                        }
                        return NewsCardWidget(article: articles[index]);
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
