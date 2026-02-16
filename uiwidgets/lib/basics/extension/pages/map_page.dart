import 'package:flutter/material.dart';
import 'package:uiwidgets/basics/extension/map_extension.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final Map<String, List<String>> families = {};
  String result = '';

  void addPerson() {
    final surname = surnameController.text.trim();
    final name = nameController.text.trim();

    if (surname.isEmpty || name.isEmpty) {
      setState(() {
        result = 'Please enter both surname and name';
      });
      return;
    }

    families.addMember(surname, name);

    setState(() {
      result = families.formattedList();
      surnameController.clear();
      nameController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Family Census (Map)',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          TextField(
            controller: surnameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Surname',
            ),
          ),
          const SizedBox(height: 12),

          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Name',
            ),
          ),

          const SizedBox(height: 16),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: addPerson,
              child: const Text('Add Person'),
            ),
          ),

          const SizedBox(height: 24),

          Expanded(
            child: SingleChildScrollView(
              child: Text(result, style: const TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
