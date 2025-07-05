import 'dart:convert';

import 'package:news_app/core/api_endpoints.dart';
import 'package:news_app/core/app_constants.dart';
import 'package:news_app/features/newsArticles/model/news_articles_model.dart';
import 'package:http/http.dart' as http;

class SearchApi {
  static Future<List<Articles>?> getsearchedArticles(
    String searchQuery,
    int page,
  ) async {
    Uri uri = Uri.https(AppConstants.baseUrl, ApiEndpoints.everyThingEndpoint, {
      'q': searchQuery,
      'apiKey': AppConstants.apiKey,
      'pageSize': '15',
      'page': page.toString(),
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
