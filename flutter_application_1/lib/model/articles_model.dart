import 'package:flutter_application_1/model/article_model.dart';

class ArticlesList {
  List<dynamic>? articles;
  ArticlesList({required this.articles});
  factory ArticlesList.fromJson(Map<String, dynamic> jsonData) {
    return ArticlesList(
      articles: jsonData['articles'],
    );
  }
}
