import 'package:flutter/material.dart';
import 'package:news_app/core/app_extention.dart';
import 'package:news_app/features/home/models/category_model_class.dart';
import 'package:news_app/features/newsSources/model/sources_model.dart';

class NewsSourcesView extends StatelessWidget {
  const NewsSourcesView({
    super.key,
    required this.selectedCategory,
    required this.sources,
  });
  final CategoryModelClass selectedCategory;
  final List<SourcesModel> sources;

  @override
  Widget build(BuildContext context) {
    return sources.isEmpty
        ? Expanded(
            child: Center(
              child: Text(
                context.loc.noNewsAvailable,
                style: context.getTextStyle().labelLarge,
              ),
            ),
          )
        : TabBar(
            isScrollable: true,

            indicatorPadding: EdgeInsetsGeometry.only(bottom: 15),
            tabs: [
              ...List.generate(
                sources.length,
                (index) => Tab(text: '${sources[index].name}'),
              ),
            ],
          );
  }
}
