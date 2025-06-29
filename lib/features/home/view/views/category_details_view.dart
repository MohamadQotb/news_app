import 'package:flutter/material.dart';
import 'package:news_app/features/newsArticles/view/views/articles_view.dart';
import 'package:news_app/features/newsSources/view/views/news_sources_view.dart';

class CategoryDetailsView extends StatelessWidget {
  const CategoryDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Column(children: [NewsSourcesView(), ArticlesView()]),
    );
  }
}
