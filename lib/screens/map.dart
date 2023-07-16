import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:favorite_places/models/place.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.isSelecting = true,
    this.location = const PlaceLocation(
      latitude: 37.33233141,
      longitude: -122.0312186,
      address: "8XJ9+WG Cupertino, CA, USA",
    ),
  });

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    final titleText =
        widget.isSelecting ? 'Pick your Location' : "Your Location";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titleText,
        ),
        actions: [
          if (widget.isSelecting)
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.save,
              ),
            )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.location.latitude,
            widget.location.longitude,
          ),
          zoom: 16,
        ),
        markers: {
          Marker(
            markerId: const MarkerId(
              'm1',
            ),
            position: LatLng(
              widget.location.latitude,
              widget.location.longitude,
            ),
          )
        },
      ),
    );
  }
}
