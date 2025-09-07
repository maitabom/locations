import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:locations/models/place.dart';
import 'package:locations/models/place_location.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  int get count {
    return _items.length;
  }

  Place getItem(int index) {
    return _items[index];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: PlaceLocation(latitude: 0.0, longitude: 0.0, address: ''),
    );

    _items.add(newPlace);
    notifyListeners();
  }
}
