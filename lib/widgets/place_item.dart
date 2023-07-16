import 'package:flutter/material.dart';

import 'package:favorite_places/models/place.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({
    super.key,
    required this.currentPlace,
    required this.onPlaceSelected,
  });

  final Place currentPlace;
  final void Function(BuildContext, Place) onPlaceSelected;

  @override
  Widget build(BuildContext context) {
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
      subtitle: Text(
        currentPlace.location.address,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      onTap: () => onPlaceSelected(context, currentPlace),
    );
  }
}
