import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/data/models/article.dart';

abstract class ArticleRepository{

  Future<DataState<List<ArticleModel>>> getNewsArticle();

}