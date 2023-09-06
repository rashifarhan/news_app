import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';

class RemoveArticleUsecase implements UseCase<void,ArticleEntity>{
  final ArticleRepository _articleRepository;

  RemoveArticleUsecase(this._articleRepository);
  @override
  Future<void> call({ArticleEntity ? params}) {
    return _articleRepository.removeArticle(params!);
  }

}