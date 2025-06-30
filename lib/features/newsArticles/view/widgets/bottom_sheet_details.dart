import 'package:flutter/material.dart';
import 'package:news_app/core/app_extention.dart';
import 'package:news_app/features/newsArticles/model/news_articles_model.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomSheetDetails extends StatelessWidget {
  const BottomSheetDetails({super.key, required this.article});
  final Articles article;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.getColor().secondaryHeaderColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
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
              Text(
                article.description ?? '',
                style: context.getTextStyle().bodyLarge,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  launchUrl(
                    Uri.parse(article.url ?? ''),
                    mode: LaunchMode.inAppWebView,
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 56),
                ),
                child: Text('View Full Article'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
