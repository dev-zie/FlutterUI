import 'package:flutter/material.dart';
import 'package:uiwidgets/basics/extension/int_extension.dart';

class IntPage extends StatefulWidget {
  const IntPage({super.key});

  @override
  State<IntPage> createState() => _IntPageState();
}

class _IntPageState extends State<IntPage> {
  int number = 0;
  String result = '';

  void checkPrime() {
    setState(() {
      if (number.isPrime) {
        result = '✅ $number is a PRIME number';
      } else {
        result = '❌ $number is NOT a prime number';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              style: IconButton.styleFrom(),
              onPressed: () {
                setState(() {
                  number--;
                });
              },
              icon: Icon(Icons.remove, size: 72, color: Colors.black),
            ),

            Text(
              number.toString(),
              style: TextStyle(fontSize: 64, color: Colors.black),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  number++;
                });
              },
              icon: Icon(Icons.add, size: 72, color: Colors.black),
            ),
          ],
        ),
        Text(result),
        ElevatedButton(onPressed: checkPrime, child: Text('Check')),
      ],
    );
  }
}
