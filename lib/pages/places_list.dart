import 'package:flutter/material.dart';

class PlacesListPage extends StatelessWidget {
  const PlacesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Lugares'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/place-form');
            },
            icon: Icon(Icons.add_location),
          ),
        ],
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
