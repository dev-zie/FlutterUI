import 'package:flutter/material.dart';
import 'package:uiwidgets/serachBar/data/entity/person.dart';
import 'package:uiwidgets/serachBar/data/entity/search_type.dart';

class SearchBarUi extends StatefulWidget {
  const SearchBarUi({super.key});

  @override
  State<SearchBarUi> createState() => _SearchBarUiState();
}

class _SearchBarUiState extends State<SearchBarUi> {
  List<Person> allPeople = [
    Person(name: "Mini", surName: "Mouse"),
    Person(name: "Mickey", surName: "Mouse"),
    Person(name: "Donald", surName: "Duck"),
  ];
  List<Person> filteredPeople = [];

  SearchType selectedType = SearchType.name;
  void initState() {
    super.initState();
    filteredPeople = allPeople;
  }

  void filterList(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredPeople = allPeople;
      } else {
        filteredPeople = allPeople.where((person) {
          if (selectedType == SearchType.name) {
            return person.name.toLowerCase().contains(query.toLowerCase());
          } else {
            return person.surName.toLowerCase().contains(query.toLowerCase());
          }
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: Text("Mini ❤️ Mickey Search"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SegmentedButton<SearchType>(
              segments: const [
                ButtonSegment(value: SearchType.name, label: Text("Name")),
                ButtonSegment(
                  value: SearchType.surname,
                  label: Text("Surname"),
                ),
              ],
              selected: {selectedType},
              onSelectionChanged: (value) {
                setState(() {
                  selectedType = value.first;
                });
              },
            ),
            const SizedBox(height: 12),

            TextField(
              decoration: const InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: filterList,
            ),
            const SizedBox(height: 20),

            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text("Name")),
                    DataColumn(label: Text("Surname")),
                  ],
                  rows: filteredPeople.map((person) {
                    return DataRow(
                      cells: [
                        DataCell(Text(person.name)),
                        DataCell(Text(person.surName)),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
