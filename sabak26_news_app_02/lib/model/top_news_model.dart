import 'package:sabak26_news_app_02/model/article.dart';

class TopNews {
  TopNews({
    required this.status,
    required this.totalResults,
    required this.article,
  });

  final String status;
  final int totalResults;
  final List<Article> article;

  factory TopNews.fromJson(Map<String, dynamic> json) {
    return TopNews(
      status: json['status'],
      totalResults: json['totalResults'],
      article: List<Article>.from(
        (json['article']).map(
          (e) => Article.fromJson(e),
        ),
      ),
    );
  }
}
