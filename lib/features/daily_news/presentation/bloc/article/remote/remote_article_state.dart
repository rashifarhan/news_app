import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable{
  final List<ArticleEntity>? articles;
  final DioException? exception;

  const RemoteArticleState({this.articles, this.exception});
  //These two parameters are considered when comparing the state
  @override
  List<Object> get props =>[articles!,exception!];


}

class RemoteArticleLoading extends RemoteArticleState{
  const RemoteArticleLoading();
}

class RemoteArticleDone extends RemoteArticleState{
  const RemoteArticleDone(List<ArticleEntity> article):super(articles:article);

}
class RemoteArticleError extends RemoteArticleState{
  const RemoteArticleError(DioException exception):super(exception: exception);

}
