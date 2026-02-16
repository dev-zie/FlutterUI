import 'package:flutter/material.dart';
import 'package:uiwidgets/UI/pageControl/data/entity/pageItem.dart';
import 'package:uiwidgets/UI/pageControl/views/pageContent.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<PageItem> pages = [
    PageItem(
      title: "Welcome",
      subtitle: "Discover the kingdom",
      image: "https://picsum.photos/130",
    ),
    PageItem(
      title: "Technology",
      subtitle: "Power of innovation",
      image: "https://picsum.photos/140",
    ),
  ];

  final List<Color> pageColors = [
    Colors.blue,
    Colors.purple,
    Colors.amberAccent,
  ];

  final PageController _controller = PageController();

  int currentPage = 0;

  Color currentColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentColor.withAlpha(120),
      body: PageView.builder(
        controller: _controller,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
            currentColor = pageColors[index];
          });
        },
        itemBuilder: (context, index) {
          return PageContent(item: pages[index]);
        },
      ),
    );
  }
}
