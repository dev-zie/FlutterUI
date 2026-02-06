import 'dart:math';

import 'package:flutter/material.dart';

class ButtonUi extends StatefulWidget {
  const ButtonUi({super.key});

  @override
  State<ButtonUi> createState() => _ButtonUiState();
}

class _ButtonUiState extends State<ButtonUi> {
  String selecteAction = 'BackUp';
  String message = 'Sheriff';
  String dailySpecial = 'Tap the button to see today\'s specials 🍽️';
  bool isShopOpen = false;

  void backUp() {
    setState(() {
      message = 'Sheriff in DANGER';
    });
  }

  void warning() {
    setState(() {
      message = 'WARNINNNGG!';
    });
  }

  void showMenu() {
    setState(() {
      if (dailySpecial != 'Tap the button to see today\'s specials 🍽️') {
        dailySpecial = 'Tap the button to see today\'s specials 🍽️';
      } else {
        dailySpecial = """🍖 Steak & Beans\n🍺 Cold Root Beer\n🥧 Apple Pie """;
      }
    });
  }

  void openBlackMarket() {
    setState(() {
      if (!isShopOpen) {
        isShopOpen = true;
      } else {
        isShopOpen = false;
      }
    });
  }
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wild West')),
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: 300,
              height: 200,
              decoration: BoxDecoration(border: Border.all(width: 2)),
              child: Text(message, style: TextStyle(fontSize: 32)),
            ),
            DropdownButton<String>(
              value: selecteAction,
              items: [
                DropdownMenuItem(value: 'BackUp', child: Text('Back Up')),
                DropdownMenuItem(value: 'Warning', child: Text('Warning!')),
              ],
              onChanged: (value) {
                setState(() {
                  selecteAction = value!;
                });
                if (value == 'BackUp') {
                  backUp();
                } else if (value == 'Warning') {
                  warning();
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                width: double.infinity,
                height: 2,
                decoration: BoxDecoration(border: Border.all(width: 4)),
              ),
            ),
            InkWell(
              onTap: showMenu,
              child: Container(
                alignment: Alignment.center,
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.blue),
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [Colors.red.withAlpha(160), Colors.red],
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://picsum.photos/300/300?random=20",
                    ),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  dailySpecial,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                width: double.infinity,
                height: 2,
                decoration: BoxDecoration(border: Border.all(width: 4)),
              ),
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith<Color>((
                  states,
                ) {
                  if (states.contains(WidgetState.pressed)) {
                    return Colors.yellow; // 👈 pressed
                  }
                  return Colors.red; // 👈 normal
                }),
              ),
              icon: Icon(Icons.shield, color: Colors.purple),
              onPressed: () {},
              label: Text('Vigilante', style: TextStyle(color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                width: double.infinity,
                height: 2,
                decoration: BoxDecoration(border: Border.all(width: 4)),
              ),
            ),
            Visibility(
              visible: isShopOpen,
              child: ElevatedButton(onPressed: () {}, child: Text('Shop')),
            ),
            ElevatedButton(
              onPressed: openBlackMarket,
              child: isShopOpen ? Text('Close Shop') : Text('Open Shop'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                width: double.infinity,
                height: 2,
                decoration: BoxDecoration(border: Border.all(width: 4)),
              ),
            ),
            InkWell(
              onTapDown: (details) {
                setState(() {
                  isPressed = true;
                });
              },
              onTapUp: (details) {
                setState(() {
                  isPressed = false;
                });
              },
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(),
                  image: DecorationImage(
                    image: isPressed ? AssetImage("assets/images/openBankBunker.jpeg") : AssetImage("assets/images/closeBankBunker.jpeg"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
