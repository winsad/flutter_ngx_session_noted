import 'package:flutter_mobile_application/models/api_reponse.dart';
import 'package:flutter_mobile_application/models/fetch_news_model.dart';
import 'package:flutter_mobile_application/models/news_model.dart';
import 'package:flutter_mobile_application/services/base/api_service.dart';

class NewsServices {
  final _apiService = ApiService();

  // fetchHeadeline
  Future<NewsResponse> fetchHeadlines(FetchHeadlinesModel model) async {
    final response = await _apiService.post(
      '/news/headlines',
      body: model.toJson(),
    );

    final dataModel = ApiReponse<NewsResponse>.fromJson(
      response,
      (json) => NewsResponse.fromJson(json),
    );

    return dataModel.data!;
  }
}
