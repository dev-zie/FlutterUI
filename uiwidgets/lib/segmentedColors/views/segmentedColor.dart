import 'package:flutter/material.dart';

class SegmentedColor extends StatefulWidget {
  const SegmentedColor({super.key});

  @override
  State<SegmentedColor> createState() => _SegmentedColorState();
}

class _SegmentedColorState extends State<SegmentedColor> {
  int selected = 0;

  Color bgcolor = Colors.red;

  double getWidth() {
    switch (selected) {
      case 0:
        return 500;
      case 1:
        return 260;
      case 2:
        return 180;
      default:
        return 250;
    }
  }

  Color getBackgroundColor() {
    switch (selected) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.pink;
      case 2:
        return Colors.cyan;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getBackgroundColor(),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: getWidth(),
          child: SegmentedButton<int>(
            segments: const [
              ButtonSegment(
                value: 0,
                label: Text("Neon Academy 2023", overflow: TextOverflow.clip),
              ),
              ButtonSegment(value: 1, label: Text("Neon")),
              ButtonSegment(value: 2, label: Text("Apps")),
            ],
            selected: {selected},
            onSelectionChanged: (value) {
              setState(() {
                selected = value.first;
              });
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.resolveWith(
                (states) => states.contains(WidgetState.selected)
                    ? Colors.greenAccent
                    : Colors.transparent,
              ),
              foregroundColor: WidgetStateProperty.all(Colors.black),
              side: WidgetStateProperty.all(
                const BorderSide(color: Colors.greenAccent),
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
