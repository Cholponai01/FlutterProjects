import 'package:sabak26_news_app_02/model/source.dart';

class Article {
  Article({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
  final Source source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String content;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json['source']),
      title: json['author'],
      description: json['description'],
      url: json['url'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}
