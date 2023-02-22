import 'dart:convert';
import 'package:news/model/article_model.dart';
import 'package:http/http.dart';

//Now let's make the HTTP request services
class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/everything?q=bitcoin&apiKey={API KEY}";

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointUrl as Uri);

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];

      //this line will put different articles from the json file and putting them into a list
      List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
