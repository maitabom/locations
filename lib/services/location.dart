import 'package:flutter_dotenv/flutter_dotenv.dart';

class LocationService {
  static String generateLocationPreviewImage({
    required double latitude,
    required double longitude,
  }) {
    final googleApiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%$latitude,$longitude&key=$googleApiKey';
  }
}
