import 'package:flutter/material.dart';
import 'package:news_app/core/app_extention.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              'https://wallpapers.com/images/hd/news-pictures-3840-x-2160-acux49abefxdu7qs.jpg',
              height: context.getSize().height * 0.258,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Text(
              '40-year-old man falls 200 feet to his death while canyoneering at national park',
              style: context.getTextStyle().labelLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              Text('By : Jon Haworth', style: context.getTextStyle().bodySmall),
              Spacer(),
              Text('15 minutes ago', style: context.getTextStyle().bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
