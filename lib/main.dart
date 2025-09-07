import 'package:flutter/material.dart';
import 'package:locations/pages/place_form.dart';
import 'package:locations/pages/places_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meus Lugares',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          primary: Colors.indigo,
          secondary: Colors.amber,
        ),
      ),
      home: const PlacesListPage(),
      routes: {'/place-form': (context) => PlaceFormPage()},
    );
  }
}
