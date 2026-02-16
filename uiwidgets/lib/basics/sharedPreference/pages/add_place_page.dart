import 'package:flutter/material.dart';
import 'package:uiwidgets/basics/sharedPreference/data/places.dart';
import 'package:uiwidgets/basics/sharedPreference/models/place.dart';

class AddPlacePage extends StatefulWidget {
  const AddPlacePage({super.key});

  @override
  State<AddPlacePage> createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  var placeController = TextEditingController();
  bool isHaveBeenThere = false;
  bool isRemoveActive = false;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7a7a7a),
      appBar: AppBar(
        title: Text('Add Place', style: TextStyle(color: Color(0xfff5f5f5))),
        backgroundColor: Color(0xff3d3d3d),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: BoxBorder.all(),
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: placeController,
                  decoration: InputDecoration(
                    hintText:
                        'What is the name of the place you want to visit?',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Have you been to this place before?',
                style: TextStyle(color: Color(0xfff5f5f5), fontSize: 18),
              ),
              Switch(
                value: isHaveBeenThere,
                onChanged: (value) {
                  setState(() {
                    isHaveBeenThere = value;
                  });
                },
              ),
            ],
          ),
          isHaveBeenThere
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    isRemoveActive
                        ? IconButton(
                            onLongPress: () {
                              if (count > 5) {
                                setState(() {
                                  isRemoveActive = false;
                                  count -= 5;
                                });
                              } else {
                                setState(() {
                                  isRemoveActive = false;
                                  count = 1;
                                });
                              }
                            },
                            style: IconButton.styleFrom(),
                            onPressed: () {
                              if (count > 1) {
                                setState(() {
                                  count--;
                                });
                                if (count == 1) {
                                  setState(() {
                                    isRemoveActive = false;
                                  });
                                }
                              }
                            },
                            icon: Icon(
                              Icons.remove,
                              size: 72,
                              color: Color(0xfff5f5f5),
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              if (count > 1) {
                                setState(() {
                                  count--;
                                });
                              }
                            },
                            icon: Icon(
                              Icons.remove,
                              size: 72,
                              color: Colors.grey,
                            ),
                          ),
                    Text(
                      count.toString(),
                      style: TextStyle(fontSize: 64, color: Color(0xfff5f5f5)),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isRemoveActive = true;
                          count++;
                        });
                      },
                      icon: Icon(Icons.add, size: 72, color: Color(0xfff5f5f5)),
                    ),
                  ],
                )
              : SizedBox(),
          ElevatedButton(
            onPressed: () async {
              if (placeController.text.isEmpty) return;

              final place = Place(
                name: placeController.text,
                hyb: isHaveBeenThere,
                hmt: isHaveBeenThere ? count : 0,
              );

              await PlacePrefs.addPlace(place);
              Navigator.pop(context);
            },
            child: Text(
              'Add',
              style: TextStyle(color: Colors.indigo, fontSize: 32),
            ),
          ),
        ],
      ),
    );
  }
}
