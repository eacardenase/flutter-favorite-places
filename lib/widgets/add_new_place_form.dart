import 'package:flutter/material.dart';

class NewPlaceForm extends StatefulWidget {
  const NewPlaceForm({super.key});

  @override
  State<NewPlaceForm> createState() => _NewPlaceFormState();
}

class _NewPlaceFormState extends State<NewPlaceForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
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
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton.icon(
          onPressed: () {},
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
