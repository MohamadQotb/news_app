import 'package:flutter/material.dart';
import 'package:news_app/features/home/models/category_model_class.dart';
import 'package:news_app/features/newsSources/model/sources_model.dart';

class NewsSourcesView extends StatefulWidget {
  const NewsSourcesView({
    super.key,
    required this.selectedCategory,
    required this.sources,
  });
  final CategoryModelClass selectedCategory;
  final List<SourcesModel> sources;

  @override
  State<NewsSourcesView> createState() => _NewsSourcesViewState();
}

class _NewsSourcesViewState extends State<NewsSourcesView> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,

      indicatorPadding: EdgeInsetsGeometry.only(bottom: 15),
      tabs: [
        ...List.generate(
          widget.sources.length,
          (index) => Tab(text: '${widget.sources[index].name}'),
        ),
      ],
    );
  }
}
