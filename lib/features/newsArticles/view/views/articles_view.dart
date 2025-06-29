import 'package:flutter/material.dart';
import 'package:news_app/features/newsArticles/view/widgets/news_card_widget.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          ...List.generate(
            10,
            (tabindex) => ListView.builder(
              itemBuilder: (context, index) => NewsCardWidget(),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
