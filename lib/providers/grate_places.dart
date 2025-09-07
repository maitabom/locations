import 'package:flutter/material.dart';
import 'package:locations/models/place.dart';

class GratePlaces with ChangeNotifier {
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
}
