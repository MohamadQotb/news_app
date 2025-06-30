import 'dart:convert';

import 'package:news_app/core/api_endpoints.dart';
import 'package:news_app/core/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/features/newsArticles/model/news_articles_model.dart';

class NewsArticlesApi {
  static Future<List<Articles>?> getNewsArticles(String sourceID) async {
    Uri uri = Uri.https(AppConstants.baseUrl, ApiEndpoints.everyThingEndpoint, {
      'sources': sourceID,
      'apiKey': AppConstants.apiKey,
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
