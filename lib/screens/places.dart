import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Place> _places = [];

    Widget mainContent = Center(
      child: Text(
        'No places added yet.',
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
      ),
    );

    if (_places.isNotEmpty) {
      mainContent = PlacesList(places: _places);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      body: mainContent,
    );
  }
}
