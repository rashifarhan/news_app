import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleState{}

class LocalArticleLoading extends LocalArticleState{}

class LocalArticleDone extends LocalArticleState{
  final List<ArticleEntity> articles;

  LocalArticleDone({required this.articles});
}