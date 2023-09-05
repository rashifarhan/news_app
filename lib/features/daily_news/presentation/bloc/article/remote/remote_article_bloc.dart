import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoterArticlesEvent,RemoteArticleState>{
  final GetArticleUseCase getArticleUseCase;
  RemoteArticleBloc(this.getArticleUseCase):super(const RemoteArticleLoading()){
    on<GetArticle>(OnGetArticle);
  }

  

  FutureOr<void> OnGetArticle(GetArticle event, Emitter<RemoteArticleState> emit) async{
    final dataState=await getArticleUseCase();
    if(dataState is DataSuccess && dataState.data!.isNotEmpty ){
     // print(dataState.data);
      emit(RemoteArticleDone(dataState.data!));
    }
    if(dataState is DataFailed){
      print(dataState.exception!.message);
      RemoteArticleError(dataState.exception!);
    }


  }
}