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
        country: countryQuery,
        category: categoryQuery,
        apiKey: newsAPIKey,
      );

      if (httpResponse.statusCode == HttpStatus.ok) {
        final List<dynamic> articlesJson = httpResponse.data['articles'];
        print(articlesJson);
        final List<ArticleModel> arttcleList = articlesJson
            .map((articleJson) => ArticleModel.fromJson(articleJson))
            .toList();
            
           

        return DataSuccess(arttcleList);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.statusMessage,
            requestOptions: httpResponse.requestOptions,
            response: httpResponse,
            type: DioExceptionType.badResponse
          ),
        ).data;
      }
    } on DioError catch (e) {
      return DataFailed(e).data;
    }
  }
}
