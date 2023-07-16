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
  LatLng? _pickedLocation;

  void _setLocation(LatLng position) {
    if (widget.isSelecting) {
      setState(() => _pickedLocation = position);
    }
  }

  @override
  Widget build(BuildContext context) {
    final titleText =
        widget.isSelecting ? 'Pick your Location' : "Your Location";

    LatLng currentLocation = LatLng(
      widget.location.latitude,
      widget.location.longitude,
    );

    if (_pickedLocation != null) {
      currentLocation = _pickedLocation!;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titleText,
        ),
        actions: [
          if (widget.isSelecting)
            IconButton(
              onPressed: () => Navigator.of(context).pop(_pickedLocation),
              icon: const Icon(
                Icons.save,
              ),
            )
        ],
      ),
      body: GoogleMap(
        onTap: _setLocation,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.location.latitude,
            widget.location.longitude,
          ),
          zoom: 16,
        ),
        markers: (_pickedLocation == null && widget.isSelecting)
            ? {}
            : {
                Marker(
                  markerId: const MarkerId(
                    'm1',
                  ),
                  position: currentLocation,
                )
              },
      ),
    );
  }
}
