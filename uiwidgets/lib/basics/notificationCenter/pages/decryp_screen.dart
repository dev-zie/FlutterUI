import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uiwidgets/basics/notificationCenter/notification_service.dart';

class DecrypScreen extends StatefulWidget {
  const DecrypScreen({super.key});

  @override
  State<DecrypScreen> createState() => _DecrypScreenState();
}

class _DecrypScreenState extends State<DecrypScreen> {
  int timeRemaining = 15;
  Timer? _timer;
  String bestClub = 'Fener';

  var answerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _baslatTimer();
  }

  void _baslatTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timeRemaining--;
      });

      if (timeRemaining == 0) {
        timer.cancel();
        Navigator.pop(context);
      }
    });
  }

  void checkAnswer() {
    if (answerController.text.toLowerCase() == bestClub.toLowerCase()) {
      _timer?.cancel();

      LocalNotificationService.showNotification('Helal', 'Bildin');

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Yanlış cevap")));
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.black,
                  color: Colors.green,
                  value: timeRemaining / 15,
                ),
              ),
              Text(
                'Best club?',
                style: TextStyle(color: Colors.green, fontSize: 24),
              ),
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.all(20),
                width: 250,
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green),
                ),
                child: Center(
                  child: TextField(
                    controller: answerController,
                    style: TextStyle(color: Colors.green, fontSize: 16),
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      focusColor: Colors.green,
                      fillColor: Colors.green,
                      hintText: 'Answer..',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: checkAnswer,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  shadowColor: Colors.green,
                ),
                child: Text('Ok', style: TextStyle(color: Colors.green)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
