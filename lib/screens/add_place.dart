import 'package:flutter/material.dart';

import 'package:favorite_places/widgets/add_new_place_form.dart';

class AddPlaceScreen extends StatelessWidget {
  const AddPlaceScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add New Place',
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(
          12,
        ),
        child: NewPlaceForm(),
      ),
    );
  }
}
