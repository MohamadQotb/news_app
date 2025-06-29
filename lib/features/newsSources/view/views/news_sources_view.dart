import 'package:flutter/material.dart';

class NewsSourcesView extends StatelessWidget {
  const NewsSourcesView({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,

      indicatorPadding: EdgeInsetsGeometry.only(bottom: 15),
      tabs: [...List.generate(10, (index) => Tab(text: 'index$index'))],
    );
  }
}
