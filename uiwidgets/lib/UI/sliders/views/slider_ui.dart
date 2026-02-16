import 'package:flutter/material.dart';

class SliderUi extends StatefulWidget {
  const SliderUi({super.key});

  @override
  State<SliderUi> createState() => _SliderUiState();
}

class _SliderUiState extends State<SliderUi> {
  double currentSliderValue = 0;
  int green = 0;
  int red = 255;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Green Side',
                  style: TextStyle(fontSize: 24, color: Colors.green),
                ),
                Image.asset(
                  'assets/images/dragon.png',
                  color: Color.fromRGBO(red, green, 0, 1),
                ),
                Text(
                  'Red Side',
                  style: TextStyle(fontSize: 24, color: Colors.red),
                ),
              ],
            ),
            Slider(
              divisions: 255,
              thumbColor: Colors.blue,
              activeColor: Color.fromRGBO(red, green, 0, 1),
              min: 0,
              max: 255,
              value: currentSliderValue,
              onChanged: (value) {
                setState(() {
                  currentSliderValue = value;
                  red = currentSliderValue.toInt();
                  green = 255 - currentSliderValue.toInt();
                });
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
