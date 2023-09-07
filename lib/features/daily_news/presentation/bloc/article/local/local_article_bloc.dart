import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/usecases/delete_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/save_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_event.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/local/local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent,LocalArticleState>{
  final GetSavedArticleUsecase getSavedArticleUsecase;
  final SaveArticleUsecase saveArticleUsecase;
  final RemoveArticleUsecase removeArticleUsecase;
  LocalArticleBloc(this.getSavedArticleUsecase, this.saveArticleUsecase, this.removeArticleUsecase):super(LocalArticleLoading()){
    on<SaveArticleEvent>(saveArticleEvent);
    on<GetSavedArticleEvent>(getSavedArticleEvent);
    on<DeleteArticleEvent>(deleteArticleEvent);
  }


  FutureOr<void> saveArticleEvent(SaveArticleEvent event, Emitter<LocalArticleState> emit)async {
    await saveArticleUsecase(params: event.articleEntity);
        final articles=await getSavedArticleUsecase();
    emit(LocalArticleDone(articles: articles));

  }

  FutureOr<void> getSavedArticleEvent(GetSavedArticleEvent event, Emitter<LocalArticleState> emit) async{
    final articles=await getSavedArticleUsecase();
    emit(LocalArticleDone(articles: articles));
  }

  FutureOr<void> deleteArticleEvent(DeleteArticleEvent event, Emitter<LocalArticleState> emit) async{
    await removeArticleUsecase(params: event.articleEntity);
    final articles=await getSavedArticleUsecase();
    emit(LocalArticleDone(articles: articles));

  }
}