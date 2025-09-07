import 'dart:io';

import 'package:locations/models/place_location.dart';

class Place {
  final String id;
  final String title;
  final File image;
  final PlaceLocation location;

  Place({
    required this.id,
    required this.title,
    required this.image,
    required this.location,
  });
}
