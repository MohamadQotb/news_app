import 'package:flutter/material.dart';
import 'package:news_app/core/app_extention.dart';
import 'package:news_app/features/newsArticles/model/news_articles_model.dart';
import 'package:news_app/features/newsArticles/view/widgets/bottom_sheet_details.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({super.key, required this.article});
  final Articles article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        showArticleDetailsBottomSheet(context, article);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        // margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: double.infinity,
        height: context.getSize().height * 0.37,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: context.getColor().secondaryHeaderColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16),
              child: Image.network(
                article.urlToImage ??
                    'https://wallpapers.com/images/hd/news-pictures-3840-x-2160-acux49abefxdu7qs.jpg',
                height: context.getSize().height * 0.258,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Text(
                article.title ?? '',
                style: context.getTextStyle().labelLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    article.author ?? 'By:UnKnown',
                    style: context.getTextStyle().bodySmall,
                  ),
                ),
                Spacer(),
                Text(
                  timeago.format(DateTime.parse(article.publishedAt!)),
                  style: context.getTextStyle().bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showArticleDetailsBottomSheet(BuildContext context, Articles article) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BottomSheetDetails(article: article);
      },
    );
  }
}
