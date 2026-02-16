import 'package:shared_preferences/shared_preferences.dart';
import '../models/place.dart';

class PlacePrefs {
  static const String _key = 'places';

  static Future<void> addPlace(Place place) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];

    final value = '${place.name};${place.hmt};${place.hyb}';
    list.add(value);

    await prefs.setStringList(_key, list);
  }

  static Future<List<Place>> getPlaces() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];

    return list.map((e) {
      final parts = e.split(';');
      return Place(
        name: parts[0],
        hmt: int.tryParse(parts[1]) ?? 0,
        hyb: parts[2] == 'true',
      );
    }).toList();
  }
}
