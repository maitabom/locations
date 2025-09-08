import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:locations/models/place.dart';
import 'package:locations/models/place_location.dart';
import 'package:locations/services/database.dart';

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

    DatabaseService.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });

    notifyListeners();
  }
}
