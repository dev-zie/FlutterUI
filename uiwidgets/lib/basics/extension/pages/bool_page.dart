import 'package:flutter/material.dart';
import 'package:uiwidgets/basics/extension/bool_extension.dart';

class BoolPage extends StatefulWidget {
  const BoolPage({super.key});

  @override
  State<BoolPage> createState() => _BoolPageState();
}

class _BoolPageState extends State<BoolPage> {
  bool valueA = false;
  bool valueB = false;
  @override
  Widget build(BuildContext context) {
    final andResult = valueA.and(valueB);
    final orResult = valueA.or(valueB);
    final notAResult = valueA.not;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Boolean Logic',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),

          SwitchListTile(
            title: const Text('Value A'),
            value: valueA,
            onChanged: (val) {
              setState(() {
                valueA = val;
              });
            },
          ),

          SwitchListTile(
            title: const Text('Value B'),
            value: valueB,
            onChanged: (val) {
              setState(() {
                valueB = val;
              });
            },
          ),

          const Divider(height: 32),

          Text('A AND B → $andResult'),
          Text('A OR B → $orResult'),
          Text('NOT A → $notAResult'),
        ],
      ),
    );
  }
}
