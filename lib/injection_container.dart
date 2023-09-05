
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final getIt=GetIt.instance;

Future<void> initializeDependencies()async{ 
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<NewsApiService>(NewsApiService(dio: getIt()));
  getIt.registerSingleton<ArticleRepository>(ArticleRepositoryImplimentation(getIt()));
  //usecases
  getIt.registerSingleton<GetArticleUseCase>(GetArticleUseCase(getIt()));
  getIt.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(getIt()),);
}