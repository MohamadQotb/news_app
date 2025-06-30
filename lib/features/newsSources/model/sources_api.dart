import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/api_endpoints.dart';
import 'package:news_app/core/app_constants.dart';
import 'package:news_app/features/newsSources/model/sources_model.dart';

class SourcesApi {
  static Future<List<SourcesModel>?> getNewsSources(String category) async {
    Uri uri = Uri.https(AppConstants.baseUrl, ApiEndpoints.sourcesEndpoint, {
      'apiKey': AppConstants.apiKey,
      'category': category.toLowerCase(),
    });
    var response = await http.get(uri);
    var jsonResponse = jsonDecode(response.body);
    SourcesResponse data = SourcesResponse.fromJson(jsonResponse);
    if (data.status == 'ok' && response.statusCode == 200) {
      return data.sources;
    } else {
      throw data.mesaage ?? 'SomeThing Went Wrong';
    }
  }
}
