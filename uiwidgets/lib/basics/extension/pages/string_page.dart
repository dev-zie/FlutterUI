import 'package:flutter/material.dart';
import 'package:uiwidgets/basics/extension/string_extension.dart';

class StringPage extends StatefulWidget {
  const StringPage({super.key});

  @override
  State<StringPage> createState() => _StringPageState();
}

class _StringPageState extends State<StringPage> {
  String result = '';

  var sController = TextEditingController();

  void checkPalindrome() {
    final text = sController.text;

    setState(() {
      if (text.isEmpty) {
        result = 'Please enter a text';
      } else if (text.isPalindrome) {
        result = '✅ This is a palindrome';
      } else {
        result = '❌ This is NOT a palindrome';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            width: 120,
            height: 100,
            child: TextField(controller: sController),
          ),
          Text(result),
          ElevatedButton(onPressed: checkPalindrome, child: Text('Check')),
        ],
      ),
    );
  }
}
