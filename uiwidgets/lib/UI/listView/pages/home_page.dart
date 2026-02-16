import 'package:flutter/material.dart';
import 'package:uiwidgets/UI/listView/data/news_list.dart';
import 'package:uiwidgets/UI/listView/widgets/news_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 75, 75, 75),
      appBar: AppBar(
        title: Text('Neon News', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 75, 75, 75),
      ),
      body: ListView.builder(
        
        padding: EdgeInsets.all(8),
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          return NewsItem(news: newsList[index]);
        },
      ),
    );
  }
}
