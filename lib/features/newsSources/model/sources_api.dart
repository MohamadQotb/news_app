import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/api_endpoints.dart';
import 'package:news_app/core/app_constants.dart';
import 'package:news_app/features/home/viewModel/app_provider.dart';
import 'package:news_app/features/newsSources/model/sources_model.dart';
import 'package:provider/provider.dart';

class SourcesApi {
  static Future<List<SourcesModel>?> getNewsSources(
    String category,
    BuildContext context,
  ) async {
    if (context.read<AppSettingsProvider>().language == 'ar') {
      category =
          context.read<AppSettingsProvider>().categoryMap[category] ?? category;
    }

    Uri uri = Uri.https(AppConstants.baseUrl, ApiEndpoints.sourcesEndpoint, {
      'apiKey': AppConstants.apiKey,
      'language': context.read<AppSettingsProvider>().language,
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
