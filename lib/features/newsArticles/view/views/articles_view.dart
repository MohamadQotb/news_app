import 'package:flutter/material.dart';
import 'package:news_app/features/newsArticles/view/widgets/news_card_widget.dart';
import 'package:news_app/features/newsSources/model/sources_model.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({super.key, this.sources});
  final List<SourcesModel>? sources;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          ...List.generate(
            sources!.length,
            (tabindex) => ListView.builder(
              itemBuilder: (context, index) => NewsCardWidget(),
              itemCount: sources!.length, //---------------
            ),
          ),
        ],
      ),
    );
  }
}
