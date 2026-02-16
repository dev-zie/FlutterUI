import 'package:flutter/material.dart';
import 'package:uiwidgets/UI/listView/models/news_model.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  DetailPage({super.key, required this.news});

  News news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
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
        ),
      ),
    );
  }
}
