import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({
    super.key,
    required this.places,
  });

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    void showPlaceDetail(BuildContext context, Place place) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PlaceDetail(place: place),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: ((context, index) {
        final currentPlace = places[index];

        return ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(
              currentPlace.image,
            ),
          ),
          title: Text(
            currentPlace.title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          onTap: () => showPlaceDetail(context, currentPlace),
        );
      }),
    );
  }
}
