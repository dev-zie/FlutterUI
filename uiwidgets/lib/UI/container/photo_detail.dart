import 'package:flutter/material.dart';
import 'package:uiwidgets/UI/container/data/entity/photos.dart';

class PhotoDetail extends StatelessWidget {
  const PhotoDetail({super.key, required this.photo, required this.index, this.iconName});

  final Photos photo;
  final int index;
  final String? iconName;

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
