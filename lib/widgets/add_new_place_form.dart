import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/providers/user_places.dart';

class NewPlaceForm extends ConsumerStatefulWidget {
  const NewPlaceForm({
    super.key,
  });

  @override
  ConsumerState<NewPlaceForm> createState() => _NewPlaceFormState();
}

class _NewPlaceFormState extends ConsumerState<NewPlaceForm> {
  final _formKey = GlobalKey<FormState>();
  var _enteredTitle = '';

  void _savePlace() {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();

      ref.read(userPlacesProvider.notifier).addPlace(_enteredTitle);

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              maxLength: 50,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.trim().length < 2) {
                  return 'Title must be between 2 and 50 characters.';
                }

                return null;
              },
              onSaved: (newValue) {
                _enteredTitle = newValue!.trim();
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(
                Icons.add,
              ),
              label: const Text(
                'Add Place',
              ),
            )
          ],
        ));
  }
}
