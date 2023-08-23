import 'dart:io';
import 'package:dio/dio.dart';

import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImplimentation implements ArticleRepository {
  final NewsApiService newsApiService;

  ArticleRepositoryImplimentation(this.newsApiService);
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    
    try {
  final httpResponse = await newsApiService.getNewsArticle(
      apiKey: newsAPIKey, country: countryQuery, category: categoryQuery);
  if (httpResponse.response.statusCode == HttpStatus.ok) {
    return DataSuccess(httpResponse.data);
  } else {
    return DataFailed(
        DioException(error: httpResponse.response.statusMessage,
          requestOptions: httpResponse.response.requestOptions,response: httpResponse.response,type: DioExceptionType.badResponse,)).data;
  }
} on DioException catch (e) {
  return DataFailed(e).data;
}
  }
}
