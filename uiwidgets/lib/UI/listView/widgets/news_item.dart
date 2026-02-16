import 'package:flutter/material.dart';
import 'package:uiwidgets/UI/listView/models/news_model.dart';
import 'package:uiwidgets/UI/listView/pages/detail_page.dart';

// ignore: must_be_immutable
class NewsItem extends StatelessWidget {
  NewsItem({super.key, required this.news});

  News news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(news: news);
            },
          ),
        );
      },
      child: Card(
        color: Colors.blueGrey,
        child: Row(
          spacing: 20,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: 200,
                  height: 100,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey.shade200,
                    child: ClipOval(
                      child: Image.network(
                        news.img,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    news.title,
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  SizedBox(height: 20),
                  Text(
                    news.subTitle,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
