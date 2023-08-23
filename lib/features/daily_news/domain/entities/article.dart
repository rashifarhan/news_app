import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int? id;
  final String? author;
  final String? tittle;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

 const ArticleEntity(
      {this.id,
      this.author,
      this.tittle,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  @override
  List<Object?> get props {
    return [
      id,
      author,
      tittle,
      description,
      url,
      urlToImage,
      publishedAt,
      content
    ];
  }
}
