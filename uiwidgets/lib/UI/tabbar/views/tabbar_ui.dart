import 'package:flutter/material.dart';

class TabbarUi extends StatelessWidget {
  TabbarUi({super.key});

  final List<Widget> pages = const [
    Center(child: Text("Tab 1")),
    Center(child: Text("Tab 2")),
    Center(child: Text("Tab 3")),
    Center(child: Text("Tab 4")),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 25, 78, 27),
        appBar: AppBar(
          title: TabBar(
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.white,
            dividerHeight: 0,
            tabs: <Widget>[
              Tab(child: Image.asset('assets/icons/avatar.png')),
              Tab(child: Image.asset('assets/icons/person.png')),
              Tab(child: Image.asset('assets/icons/man.png')),
              Tab(child: Image.asset('assets/icons/superhero.png')),
            ],
          ),
          backgroundColor: Colors.purple,
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text(
                "Hi",
                style: TextStyle(color: Colors.white, fontSize: 120),
              ),
            ),
            Center(
              child: Text(
                "I",
                style: TextStyle(color: Colors.white, fontSize: 120),
              ),
            ),
            Center(
              child: Text(
                "Am",
                style: TextStyle(color: Colors.white, fontSize: 120),
              ),
            ),
            Center(
              child: Text(
                "HULKK",
                style: TextStyle(color: Colors.white, fontSize: 120),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
