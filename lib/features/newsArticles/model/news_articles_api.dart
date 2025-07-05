import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/core/api_endpoints.dart';
import 'package:news_app/core/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/features/home/viewModel/app_provider.dart';
import 'package:news_app/features/newsArticles/model/news_articles_model.dart';
import 'package:provider/provider.dart';

class NewsArticlesApi {
  static Future<List<Articles>?> getNewsArticles(
    String sourceID,
    BuildContext context,
  ) async {
    Uri uri = Uri.https(AppConstants.baseUrl, ApiEndpoints.everyThingEndpoint, {
      'sources': sourceID,
      'apiKey': AppConstants.apiKey,
      'language': context.read<AppSettingsProvider>().language,
    });
    var response = await http.get(uri);
    var jsonResponse = jsonDecode(response.body);

    NewsArticlesModel data = NewsArticlesModel.fromJson(jsonResponse);
    if (data.status == 'ok' && response.statusCode == 200) {
      return data.articles;
    } else {
      throw data.message!;
    }
  }
}
