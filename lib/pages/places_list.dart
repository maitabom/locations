import 'package:flutter/material.dart';
import 'package:locations/providers/great_places.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<GreatPlaces>(
        builder: (context, greatPlaces, child) {
          if (greatPlaces.count == 0) {
            return Center(child: Text('Nenhum local cadastrado'));
          } else {
            return ListView.builder(
              itemCount: greatPlaces.count,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(greatPlaces.getItem(index).image),
                ),
                title: Text(greatPlaces.getItem(index).title),
                onTap: () {},
              ),
            );
          }
        },
      ),
    );
  }
}
