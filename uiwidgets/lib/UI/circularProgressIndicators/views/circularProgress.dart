import 'dart:math';

import 'package:flutter/material.dart';

class Circularprogress extends StatefulWidget {
  const Circularprogress({super.key});

  @override
  State<Circularprogress> createState() => _CircularprogressState();
}

class _CircularprogressState extends State<Circularprogress> {
  bool loading = false;
  int counter = 0;
  Color currentColor = Colors.blue;
  int colorIndex = 0;
  final random = Random();

  List<Color> colors = [
    Colors.blue,
    Colors.black,
    Colors.brown,
    Colors.teal,
    Colors.purple,
    Colors.lime,
    Colors.indigo,
    Colors.blueGrey,
  ];

  Future<void> startCounting() async {
    setState(() {
      loading = true;
      counter = 0;
    });

    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 50));

      if (i % 10 == 1) {
        setState(() {
          colorIndex = random.nextInt(colors.length);
        });
      }

      setState(() {
        counter = i;
      });
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              loading
                  ? CircularProgressIndicator(color: colors[colorIndex])
                  : SizedBox(),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      iconColor: Colors.white,
                    ),
                    onPressed: loading ? null : startCounting,
                    child: loading
                        ? SizedBox(
                            width: 24,
                            height: 24,
                            child: Icon(Icons.watch_later_outlined),
                          )
                        : Icon(Icons.play_arrow),
                  ),
                  SizedBox(width: 20),
                  Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.yellow,
                    ),
                    child: Text(counter.toString()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
