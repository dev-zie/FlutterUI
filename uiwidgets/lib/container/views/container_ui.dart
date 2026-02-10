import 'package:flutter/material.dart';
import 'package:uiwidgets/container/data/entity/photos.dart';
import 'package:uiwidgets/container/views/photo_detail.dart';

class ContainerUI extends StatelessWidget {
  const ContainerUI({super.key});

  @override
  Widget build(BuildContext context) {
    List<Photos> photos = [
      Photos(url: 'https://picsum.photos/300/300?random=1'),
      Photos(url: 'https://picsum.photos/300/300?random=2'),
      Photos(url: 'https://picsum.photos/300/300?random=3'),
      Photos(url: 'https://picsum.photos/300/300?random=4'),
      Photos(url: 'https://picsum.photos/300/300?random=5'),
      Photos(url: 'https://picsum.photos/300/300?random=6'),
      Photos(url: 'https://picsum.photos/300/300?random=7'),
      Photos(url: 'https://picsum.photos/300/300?random=8'),
      Photos(url: 'https://picsum.photos/300/300?random=9'),
      Photos(url: 'https://picsum.photos/300/300?random=10'),
      Photos(url: 'https://picsum.photos/300/300?random=11'),
      Photos(url: 'https://picsum.photos/300/300?random=12'),
      Photos(url: 'https://picsum.photos/300/300?random=13'),
      Photos(url: 'https://picsum.photos/300/300?random=14'),
      Photos(url: 'https://picsum.photos/300/300?random=15'),
      Photos(url: 'https://picsum.photos/300/300?random=16'),
      Photos(url: 'https://picsum.photos/300/300?random=17'),
      Photos(url: 'https://picsum.photos/300/300?random=18'),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Photo Gallery')),
      body: Center(
        child: GridView.builder(
          itemCount: photos.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PhotoDetail(photo: photos[index], index: index),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: Colors.black),
                    color: Color.fromARGB(250, 80, 0, 10),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Image.network(photos[index].url, height: 90),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Photo ${index + 1}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
