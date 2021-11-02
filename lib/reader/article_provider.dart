import 'package:comic/public.dart';

class ArticleProvider {
  static Future<Article> fetchArticle(int articleId) async {
    var response = await Request.get(url: 'article_$articleId', params: {});
    var article = Article.fromJson(response);

    return article;
  }
}