import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository{
  //API methods
  Future<DataState<List<ArticleModel>>> getNewsArticle();
  //Database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity articleEntity);

  Future<void> removeArticle(ArticleEntity articleEntity);

}