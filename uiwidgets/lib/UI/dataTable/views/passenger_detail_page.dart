// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:uiwidgets/UI/dataTable/data/entity/passenger.dart';

class PassengerDetailPage extends StatelessWidget {
  PassengerDetailPage({super.key, required this.p});

  Passenger p;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(80),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(p.name, style: TextStyle(color: Colors.white, fontSize: 32)),
              Text(p.surname, style: TextStyle(color: Colors.white, fontSize: 32)),
              Text(p.age.toString(), style: TextStyle(color: Colors.white, fontSize: 24)),
              Text(p.mail, style: TextStyle(color: Colors.white, fontSize: 12)),
              Text(p.team, style: TextStyle(color: Colors.white, fontSize: 36)),
            ],
          ),
        ),
      ),
    );
  }
}
