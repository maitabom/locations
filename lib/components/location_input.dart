import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:locations/services/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locationData = await Location().getLocation();

    final staticMapImageUrl = LocationService.generateLocationPreviewImage(
      latitude: locationData.latitude!,
      longitude: locationData.longitude!,
    );

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl == null
              ? Text('Localização não informada')
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          children: [
            TextButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Localização atual'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: _getCurrentUserLocation,
            ),
            TextButton.icon(
              icon: Icon(Icons.map),
              label: Text('Selecione no mapa'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
