import 'package:flutter/material.dart';

class StackUi extends StatelessWidget {
  const StackUi({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.black),

          Positioned(
            top: height * 0.2,
            left: width * 0.1,
            child: const Text(
              "Expelliarmus",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),

          Positioned(
            top: height * 0.35,
            right: width * 0.1,
            child: const Text(
              "Expecto Patronum",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),

          Positioned(
            bottom: height * 0.25,
            left: width * 0.1,
            child: const Text(
              "Lumos",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),

          Positioned(
            bottom: height * 0.1,
            right: width * 0.1,
            child: const Text(
              "Avada Kedavra",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
