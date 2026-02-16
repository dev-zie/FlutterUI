import 'package:flutter/material.dart';
import 'package:uiwidgets/basics/extension/pages/bool_page.dart';
import 'package:uiwidgets/basics/extension/pages/date_page.dart';
import 'package:uiwidgets/basics/extension/pages/int_page.dart';
import 'package:uiwidgets/basics/extension/pages/map_page.dart';
import 'package:uiwidgets/basics/extension/pages/set_page.dart';
import 'package:uiwidgets/basics/extension/pages/string_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: 'String'),
              Tab(text: 'Int'),
              Tab(text: 'Date'),
              Tab(text: 'Bool'),
              Tab(text: 'Set'),
              Tab(text: 'Map'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: StringPage()),
            Center(child: IntPage()),
            Center(child: DatePage()),
            Center(child: BoolPage()),
            Center(child: SetPage()),
            Center(child: MapPage()),
          ],
        ),
      ),
    );
  }
}
