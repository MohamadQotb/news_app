import 'package:flutter/material.dart';
import 'package:news_app/core/app_assets.dart';
import 'package:news_app/core/app_extention.dart';
import 'package:news_app/features/home/models/category_model_class.dart';
import 'package:news_app/features/home/view/widgets/category_widget.dart';

class CategoryView extends StatelessWidget {
  final void Function(CategoryModelClass) onCatClicked;
  const CategoryView({super.key, required this.onCatClicked});

  @override
  Widget build(BuildContext context) {
    final List<CategoryModelClass> categories = [
      CategoryModelClass(
        categoryName: context.loc.general,
        categoryImage: AppAssets.generalCat,
      ),
      CategoryModelClass(
        categoryName: context.loc.business,
        categoryImage: AppAssets.buisnessCat,
      ),

      CategoryModelClass(
        categoryName: context.loc.sports,
        categoryImage: AppAssets.sportsCat,
      ),
      CategoryModelClass(
        categoryName: context.loc.technology,
        categoryImage: AppAssets.technologyCat,
      ),
      CategoryModelClass(
        categoryName: context.loc.entertainment,
        categoryImage: AppAssets.entertainmentcat,
      ),
      CategoryModelClass(
        categoryName: context.loc.health,
        categoryImage: AppAssets.healthCat,
      ),

      CategoryModelClass(
        categoryName: context.loc.science,
        categoryImage: AppAssets.scienceCat,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${context.loc.goodMorning}\n${context.loc.newsForYou}',
            style: context.getTextStyle().titleLarge,
          ),
          SizedBox(height: 16),

          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => onCatClicked(categories[index]),
                child: CategoryWidget(
                  category: categories[index],
                  index: index,
                ),
              ),

              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
