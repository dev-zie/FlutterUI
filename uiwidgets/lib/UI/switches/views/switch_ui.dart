import 'package:flutter/material.dart';

class SwitchUi extends StatefulWidget {
  const SwitchUi({super.key});

  @override
  State<SwitchUi> createState() => _SwitchUiState();
}

class _SwitchUiState extends State<SwitchUi> {
  Color backgroundClr = Colors.red;
  bool isGreen = false;
  WidgetStateProperty<Color?> thumbColor = WidgetStateProperty<Color?>.fromMap(
    <WidgetStatesConstraint, Color>{WidgetState.selected: Colors.black},
  );

  WidgetStateProperty<Color?> trackColor = WidgetStateProperty<Color?>.fromMap(
    <WidgetStatesConstraint, Color>{WidgetState.selected: Colors.white},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundClr,
      body: Center(
        child: Switch(
          trackColor: trackColor,
          thumbColor: thumbColor,
          trackOutlineColor: thumbColor,
          value: isGreen,
          onChanged: (value) {
            setState(() {
              isGreen = value;
              if (value) {
                backgroundClr = Colors.green;
              } else {
                backgroundClr = Colors.red;
              }
            });
          },
        ),
      ),
    );
  }
}
