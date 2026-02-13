import 'package:flutter/material.dart';
import 'package:uiwidgets/dataTable/data/entity/passenger.dart';
import 'package:uiwidgets/dataTable/views/passenger_detail_page.dart';

class DataTableUi extends StatefulWidget {
  const DataTableUi({super.key});

  @override
  State<DataTableUi> createState() => _DataTableUiState();
}

class _DataTableUiState extends State<DataTableUi> {
  List<Passenger> passengers = [
    Passenger(
      name: "Ahmet",
      surname: "Yılmaz",
      team: "Flutter",
      age: 24,
      hometown: "İstanbul",
      mail: "ahmet@academy.com",
    ),
    Passenger(
      name: "Ayşe",
      surname: "Demir",
      team: "iOS",
      age: 26,
      hometown: "Ankara",
      mail: "ayse@academy.com",
    ),
    Passenger(
      name: "Mehmet",
      surname: "Kaya",
      team: "Android",
      age: 23,
      hometown: "İzmir",
      mail: "mehmet@academy.com",
    ),
    Passenger(
      name: "Zeynep",
      surname: "Çelik",
      team: "Design",
      age: 25,
      hometown: "Bursa",
      mail: "zeynep@academy.com",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            showCheckboxColumn: false,
            columns: [
              DataColumn(label: Text("Name")),
              DataColumn(label: Text("Surname")),
              DataColumn(label: Text("Team")),
              DataColumn(label: Text("Age")),
              DataColumn(label: Text("Hometown")),
              DataColumn(label: Text("Mail")),
            ],
            rows: passengers.map((passenger) {
              return DataRow(
                onSelectChanged: (value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PassengerDetailPage(p: passenger),
                    ),
                  );
                },
                cells: [
                  DataCell(Text(passenger.name)),
                  DataCell(Text(passenger.surname)),
                  DataCell(Text(passenger.team)),
                  DataCell(Text(passenger.age.toString())),
                  DataCell(Text(passenger.hometown)),
                  DataCell(Text(passenger.mail)),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
