import 'package:flutter/cupertino.dart';
import 'package:news/model/article_model.dart';
import 'package:news/pages/articles_details_page.dart';
import 'package:flutter/material.dart';

Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                    article: article,
                  )));
    },
    child: Container(

      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),

          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 7.0,
              spreadRadius: 2.0,
                offset: Offset(0, 3)
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  children: [
                    Text(
                      '2hr ago',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 10
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      article.source.name,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w800,
                          fontSize: 12
                      ),
                    ),

                  ],

                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 220,
                child: Text(
                  article.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                width: 220,
                child: Text(
                  article.description,
                  style: TextStyle(
                    fontSize: 10.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 6.0,
          ),
          Container(
            height: 100.0,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(article.urlToImage), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ],
      ),
    ),
  );
}
