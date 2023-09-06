
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:news_app/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_app/features/daily_news/domain/usecases/delete_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/save_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final getIt=GetIt.instance;

Future<void> initializeDependencies()async{ 
  final database=await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  getIt.registerSingleton<AppDatabase>(database);
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<NewsApiService>(NewsApiService(dio: getIt()));
  getIt.registerSingleton<ArticleRepository>(ArticleRepositoryImplimentation(getIt(),getIt()));
  getIt.registerSingleton<GetArticleUseCase>(GetArticleUseCase(getIt()));
  getIt.registerSingleton<GetSavedArticleUsecase>(GetSavedArticleUsecase(getIt()));
  getIt.registerSingleton<RemoveArticleUsecase>(RemoveArticleUsecase(getIt()));
  getIt.registerSingleton<SaveArticleUsecase>(SaveArticleUsecase(getIt()));
  getIt.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(getIt()),);
  getIt.registerFactory<LocalArticleBloc>(() => LocalArticleBloc(getIt(), getIt(), getIt()));
}