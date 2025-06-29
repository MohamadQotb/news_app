import 'package:flutter/material.dart';
import 'package:news_app/core/app_assets.dart';
import 'package:news_app/core/app_extention.dart';
import 'package:news_app/features/home/models/category_model_class.dart';
import 'package:news_app/features/home/widgets/category_widget.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

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
    return Padding(
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
    );
  }
}
