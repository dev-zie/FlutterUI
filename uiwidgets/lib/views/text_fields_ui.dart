import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldsUi extends StatefulWidget {
  const TextFieldsUi({super.key});

  @override
  State<TextFieldsUi> createState() => _TextFieldsUiState();
}

class _TextFieldsUiState extends State<TextFieldsUi> {
  var tfName = TextEditingController();
  var tfEmail = TextEditingController();
  var tfPhone = TextEditingController();

  String? errorText;
  bool showError = false;

  bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kingdom')),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              child: TextField(
                keyboardType: TextInputType.name,
                controller: tfName,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter Name-Surname',
                  hintStyle: TextStyle(color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 2),
            Container(
              padding: EdgeInsets.all(8),
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 225, 232, 10),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              child: TextField(
                onSubmitted: (value) {
                  setState(() {
                    if (!isValidEmail(value)) {
                      showError = true;
                    } else {
                      showError = false;
                      FocusScope.of(context).unfocus(); // klavye kapanır
                    }
                  });
                },
                keyboardType: TextInputType.emailAddress,
                controller: tfEmail,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(
                    color: Colors.blue,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: showError,
              child: Text(
                'Invalid email format',
                style: TextStyle(color: Colors.red),
              ),
            ),
            SizedBox(height: 2),
            Container(
              padding: EdgeInsets.all(8),
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(14)),
              ),
              child: TextField(
                onSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                },
                maxLines: 10,
                controller: tfPhone,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: false,
                  signed: false,
                ),
                textInputAction: TextInputAction.done,
                style: TextStyle(color: Colors.blue),
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  hintText: 'Enter Phone Number',
                  hintStyle: TextStyle(
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
          ],
        ),
      ),
    );
  }
}
