import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class LocalArticleEvent{}

class GetSavedArticleEvent extends LocalArticleEvent{
  
}

class SaveArticleEvent extends LocalArticleEvent{
  final ArticleEntity articleEntity;

  SaveArticleEvent({required this.articleEntity});
}

class DeleteArticleEvent extends LocalArticleEvent{
  final ArticleEntity articleEntity;

  DeleteArticleEvent({required this.articleEntity});
  
}