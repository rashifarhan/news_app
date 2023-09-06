import 'package:floor/floor.dart';
import 'package:news_app/features/daily_news/domain/entities/article.dart';
@Entity(tableName: 'article',primaryKeys: ['author'])
class ArticleModel extends ArticleEntity {
  const ArticleModel({
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) : super(
    author: author,
    title: title,
    description: description,
    url: url,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
    content: content,
  );

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
     author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map["urlToImage"] ?? "",
      publishedAt: map["publishedAt"] ?? "",
      content: map['content'] ?? "",
    );
  }

  factory ArticleModel.fromEntity(ArticleEntity articleEntity){
    return ArticleModel(
      author: articleEntity.author,
      title: articleEntity.title,
      description: articleEntity.description,
      url: articleEntity.url,
      urlToImage: articleEntity.urlToImage,
      publishedAt: articleEntity.publishedAt,
      content: articleEntity.content
    );
  }
}
