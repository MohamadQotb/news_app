import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/core/app_assets.dart';
import 'package:news_app/core/app_extention.dart';
import 'package:news_app/features/home/view/models/category_model_class.dart';
import 'package:news_app/features/home/view/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/homeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModelClass> categories = [
      CategoryModelClass(
        categoryName: 'General',
        categoryImage: AppAssets.generalCat,
      ),
      CategoryModelClass(
        categoryName: 'Business',
        categoryImage: AppAssets.buisnessCat,
      ),

      CategoryModelClass(
        categoryName: 'Sports',
        categoryImage: AppAssets.sportsCat,
      ),
      CategoryModelClass(
        categoryName: 'Technology',
        categoryImage: AppAssets.technologyCat,
      ),
      CategoryModelClass(
        categoryName: 'Entertainment',
        categoryImage: AppAssets.entertainmentcat,
      ),
      CategoryModelClass(
        categoryName: 'Health',
        categoryImage: AppAssets.healthCat,
      ),

      CategoryModelClass(
        categoryName: 'Science',
        categoryImage: AppAssets.scienceCat,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ImageIcon(AssetImage(AppAssets.searchIcon)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning\nHere is Some News For You',
              style: context.getTextStyle().titleLarge,
            ),
            SizedBox(height: 16),

            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemBuilder: (context, index) =>
                    CategoryWidget(category: categories[index], index: index),

                itemCount: categories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
