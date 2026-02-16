import 'package:flutter/material.dart';
import 'package:uiwidgets/basics/extension/set_extension.dart';

class SetPage extends StatefulWidget {
  const SetPage({super.key});

  @override
  State<SetPage> createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  final TextEditingController _controller = TextEditingController();
  String result = '';

  void removeDuplicates() {
    final input = _controller.text;

    if (input.isEmpty) {
      setState(() {
        result = 'Please enter some values';
      });
      return;
    }

    final list = input.split(',').map((e) => e.trim()).toList();
    final uniqueSet = list.toUniqueSet();

    setState(() {
      result = 'Unique values: ${uniqueSet.join(', ')}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Remove Duplicates (Set)',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'a, b, a, c, b',
            ),
          ),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: removeDuplicates,
              child: const Text('Remove Duplicates'),
            ),
          ),

          const SizedBox(height: 20),

          Text(
            result,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
