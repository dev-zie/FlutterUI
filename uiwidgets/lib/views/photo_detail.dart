// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:uiwidgets/data/entity/photos.dart';

class PhotoDetail extends StatelessWidget {
  PhotoDetail({super.key, required this.photo, required this.index});

  Photos photo;
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(color: Color.fromARGB(250, 160, 160, 160)),
          alignment: Alignment.center,
          width: 220,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.network(photo.url), Text('Photo $index')],
          ),
        ),
      ),
    );
  }
}
