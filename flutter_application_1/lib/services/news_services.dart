import 'dart:convert';

import 'package:flutter_application_1/model/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/model/articles_model.dart';

class NewsData {
  String apiKey = '36479e94e45240c4b564463b32061aff';
  static Future<List<Article>?> fetchArticles() async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=eg&apiKey=36479e94e45240c4b564463b32061aff'));
      if (response.statusCode == 200) {
        String data = response.body;
        Map<String, dynamic> jsonData = jsonDecode(data);
        var articles = ArticlesList.fromJson(jsonData);
        List<Article> articlesList =
            articles.articles!.map((e) => Article.fromJson(e)).toList();
        return articlesList;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }

  Future<List<Article>?> fetchArticlesByCategory(String category) async {
    try {
      http.Response response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=36479e94e45240c4b564463b32061aff'));
      if (response.statusCode == 200) {
        String data = response.body;
        Map<String, dynamic> jsonData = jsonDecode(data);
        ArticlesList articles = ArticlesList.fromJson(jsonData);
        List<Article> articlesList =
            articles.articles!.map((e) => Article.fromJson(e)).toList();
        return articlesList;
      } else {
        print('status code = ${response.statusCode}');
      }
    } catch (ex) {
      print(ex);
    }
  }
}
