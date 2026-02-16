import 'package:flutter/material.dart';

class TheLinearProgressIndicatorUI extends StatefulWidget {
  const TheLinearProgressIndicatorUI({super.key});

  @override
  State<TheLinearProgressIndicatorUI> createState() =>
      _TheLinearProgressIndicatorUIState();
}

class _TheLinearProgressIndicatorUIState
    extends State<TheLinearProgressIndicatorUI> {
  int step = 0;
  double get indicator => step / 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 98, 21, 16),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                border: Border.all(
                  color: Colors.teal,
                  style: BorderStyle.solid,
                  width: 20,
                ),
              ),
              child: Image.asset('assets/images/alaaddin.png'),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                backgroundColor: Colors.black,
                color: Colors.blue,
                value: indicator,
              ),
            ),
            SizedBox(height: 20),
            IconButton(
              onPressed: () {
                if (step == 10) {
                  setState(() {
                    step = 0;
                  });
                } else {
                  setState(() {
                    step++;
                  });
                }
              },
              icon: Icon(
                size: 80,
                Icons.local_fire_department_outlined,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
