class Article {
  final String? title;
  final String? description;
  final String? urlToImage;
  final String? url;

  Article({this.title, this.description, this.urlToImage, this.url});

  factory Article.fromJson(Map<String, dynamic> jsonData) {
    return Article(
        title: jsonData['title'],
        description: jsonData['description'],
        urlToImage: jsonData['urlToImage'],
        url: jsonData['url']);
  }
}
