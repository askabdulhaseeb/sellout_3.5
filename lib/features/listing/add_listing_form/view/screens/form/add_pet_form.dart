import 'package:flutter/material.dart';

class AddPetForm extends StatelessWidget {
  const AddPetForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Pet Screen')),
      body: const Center(child: Text('Add Pet Screen')),
    );
  }
}
