import 'package:flutter/material.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/core/app_extention.dart';
import 'package:news_app/features/home/view/models/category_model_class.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModelClass category;
  final int index;
  const CategoryWidget({
    super.key,
    required this.category,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.getSize().height * 0.23,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: context.getColor().secondaryHeaderColor,
      ),
      child: index % 2 == 0
          ? Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  SizedBox(
                    height: context.getSize().height * 0.23,

                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.only(
                        topLeft: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                      ),
                      child: Image.asset(
                        fit: BoxFit.fitHeight,
                        category.categoryImage,
                        width: context.getSize().width * 0.40,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Text(
                        category.categoryName,
                        style: context.getTextStyle().titleLarge!.copyWith(
                          color: context.getColor().primaryColor,
                          fontSize: 30,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 16),
                        decoration: BoxDecoration(
                          color: context.getColor().primaryColor.withValues(
                            alpha: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(84),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'View All',
                              style: context.getTextStyle().titleLarge,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 16),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: context.getColor().primaryColor,
                                borderRadius: BorderRadius.circular(10000),
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: context.getColor().secondaryHeaderColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Text(
                        category.categoryName,
                        style: context.getTextStyle().titleLarge!.copyWith(
                          color: context.getColor().primaryColor,
                          fontSize: 30,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: context.getColor().primaryColor.withValues(
                            alpha: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(84),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 16),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: context.getColor().primaryColor,
                                borderRadius: BorderRadius.circular(10000),
                              ),
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: context.getColor().secondaryHeaderColor,
                              ),
                            ),
                            Text(
                              'View All',
                              style: context.getTextStyle().titleLarge,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.getSize().height * 0.23,

                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.only(
                        topRight: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                      child: Image.asset(
                        fit: BoxFit.fitHeight,
                        category.categoryImage,
                        width: context.getSize().width * 0.35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
