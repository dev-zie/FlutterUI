import 'package:flutter/material.dart';
import 'package:uiwidgets/basics/sharedPreference/models/place.dart';

// ignore: must_be_immutable
class PlacesItem extends StatelessWidget {
  PlacesItem({super.key, required this.place});

  Place place;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xffe80000),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              place.name,
              style: TextStyle(fontSize: 24, color: Color(0xfff5f5f5)),
            ),
            Spacer(),
            Text(
              place.hmt.toString(),
              style: TextStyle(
                fontSize: 24,
                color: Color(0xfff5f5f5),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            place.hyb
                ? Icon(Icons.place, color: Color(0xfff5f5f5))
                : Icon(Icons.place_outlined, color: Color(0xfff5f5f5)),
          ],
        ),
      ),
    );
  }
}
