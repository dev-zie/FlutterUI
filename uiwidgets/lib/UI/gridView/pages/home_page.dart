// ignore_for_file: sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/UI/gridView/data/app_list.dart';
import 'package:uiwidgets/UI/gridView/widgets/app_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> refreshApps() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Neon Apps')),
      body: RefreshIndicator(
        child: GridView.builder(
          padding: EdgeInsets.all(8),
          itemCount: appList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return AppGridItem(app: appList[index]);
          },
        ),
        onRefresh: refreshApps,
      ),
    );
  }
}
