import 'package:flutter/material.dart';

class StepUi extends StatefulWidget {
  const StepUi({super.key});

  @override
  State<StepUi> createState() => _StepUiState();
}

class _StepUiState extends State<StepUi> {
  List<Step> stepList() {
    return List.generate(6, (index) {
      return Step(
        title: Text(score.toString()),
        content: _stepContent(index),
        isActive: currentStep >= index,
      );
    });
  }

  bool isFinished = false;

  Widget _stepContent(int index) {
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ), // 0 yaparsan tam kare
                ),
              ),
              onPressed: () {
                if (currentStep < stepList().length - 1) {
                  setState(() {
                    currentStep++;
                    if (score <= 50) {
                      score += 10;
                    }
                  });
                }
              },
              child: Image.network('https://picsum.photos/130', width: 140),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    12,
                  ), // 0 yaparsan tam kare
                ),
              ),
              onPressed: () {
                if (currentStep > 0) {
                  setState(() {
                    currentStep--;
                    if (!(score <= 0)) {
                      score -= 10;
                    }
                  });
                }
              },
              child: Image.network('https://picsum.photos/120', width: 140),
            ),
          ],
        ),
      ],
    );
  }

  int currentStep = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: SafeArea(
        child: Stepper(
          controlsBuilder: (context, details) {
            return const SizedBox(); // default butonlar yok
          },
          currentStep: currentStep,
          type: StepperType.vertical,
          steps: stepList(),
        ),
      ),
    );
  }
}
