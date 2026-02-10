import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alertui extends StatefulWidget {
  const Alertui({super.key});

  @override
  State<Alertui> createState() => _AlertuiState();
}

class _AlertuiState extends State<Alertui> {
  String buttonTitle = 'Alert';
  var alertController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 300,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white70),
                borderRadius: BorderRadius.circular(90),
              ),
              child: Text(
                buttonTitle,
                style: TextStyle(color: Colors.lime, fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Alert"),
                      content: Text("Alert with no buttons"),
                    );
                  },
                );
              },
              child: Text('Alert'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Alert"),
                      content: Text("Alert with button"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              buttonTitle = 'Alert with button';
                            });
                            Navigator.pop(context);
                          },
                          child: Text('Ok'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Alert'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Alert"),
                      content: Text("Alert with two buttons"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              buttonTitle = 'Alert with two buttons';
                            });
                          },
                          child: Text('Ok'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Alert'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Alert"),
                      content: Text("Alert with two buttons"),
                      actions: [
                        TextField(
                          controller: alertController,
                          decoration: InputDecoration(
                            hintText: 'Say Something',
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              buttonTitle = alertController.text;
                            });
                            Navigator.pop(context);
                          },
                          child: Text('Ok'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Alert'),
            ),
            ElevatedButton(
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return CupertinoActionSheet(
                      title: Text("Choose an option"),
                      message: Text("Please select one of the actions below"),
                      actions: [
                        CupertinoActionSheetAction(
                          onPressed: () {
                            setState(() {
                              buttonTitle = 'Option 2';
                            });
                            buttonTitle = 'Option 1';

                            Navigator.pop(context);
                          },
                          child: Text("Option 1"),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () {
                            setState(() {
                              buttonTitle = 'Option 2';
                            });
                            Navigator.pop(context);
                          },
                          child: Text("Option 2"),
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel"),
                      ),
                    );
                  },
                );
              },
              child: Text('Alert'),
            ),
          ],
        ),
      ),
    );
  }
}
