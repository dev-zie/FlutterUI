import 'package:flutter/material.dart';
import 'package:uiwidgets/basics/sharedPreference/data/places.dart';
import 'package:uiwidgets/basics/sharedPreference/models/place.dart';
import 'package:uiwidgets/basics/sharedPreference/pages/add_place_page.dart';
import 'package:uiwidgets/basics/sharedPreference/widgets/places_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Place> places = [];

  @override
  void initState() {
    super.initState();
    loadPlaces();
  }

  Future<void> loadPlaces() async {
    places = await PlacePrefs.getPlaces();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7a7a7a),
      appBar: AppBar(
        backgroundColor: Color(0xff3d3d3d),
        title: Text(
          'Travel Tracker',
          style: TextStyle(color: Color(0xfff5f5f5)),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: loadPlaces,
        child: ListView.builder(
          itemCount: places.length,
          itemBuilder: (context, index) {
            return PlacesItem(place: places[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddPlacePage()),
          );
          loadPlaces();
        },
        backgroundColor: Color(0xff000000),
        child: Icon(Icons.add, color: Color(0xfff5f5f5)),
      ),
    );
  }
}
