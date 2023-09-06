import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImplimentation implements ArticleRepository {
  final NewsApiService newsApiService;
  final AppDatabase appDatabase;

  ArticleRepositoryImplimentation(this.newsApiService,this.appDatabase);

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
    } on DioException catch (e) {
      return DataFailed(e).data;
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() {
   return appDatabase.aticleDAO.getArticle();
  }

  @override
  Future<void> removeArticle(ArticleEntity articleEntity) {
    return appDatabase.aticleDAO.deleteArticle(ArticleModel.fromEntity(articleEntity));
  }

  @override
  Future<void> saveArticle(ArticleEntity articleEntity) {
   return appDatabase.aticleDAO.insertArticle(ArticleModel.fromEntity(articleEntity));
  }
}
