import 'dart:convert';
import 'package:get/get.dart';

import '../model/article_model.dart';

import '../services/news_services.dart';

class NewsController extends GetxController {
  NewsData newsdata = NewsData();
  RxInt currentIndex = 0.obs;
  var newslist = <Article>[].obs;
  // RxList<Article> newslist = (List<Article>.of([])).obs;

  var listBycategory = <Article>[].obs;

  var isloading = true.obs;
  @override
  void onInit() {
    super.onInit();
    getnews();
  }

  Future<RxList<Article>?> getnews() async {
    var ne = await NewsData.fetchArticles();
    try {
      isloading.value = true;

      if (ne!.isNotEmpty) {
        newslist.addAll(ne);
        return newslist;
      }
    } finally {
      isloading.value = false;
    }
  }

  Future<RxList<Article>?> getnewsbycategory(String category) async {
    var cat = await newsdata.fetchArticlesByCategory(category);
    try {
      isloading.value = true;
      if (cat!.isNotEmpty) {
        listBycategory.addAll(cat);
        // for (var i in listBycategory) {
        //   print(i.title);
        // }
        return listBycategory;
      }
    } finally {
      isloading.value = false;
    }
  }
}
