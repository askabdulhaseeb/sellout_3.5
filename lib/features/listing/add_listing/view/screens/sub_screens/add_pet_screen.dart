import 'package:flutter/material.dart';

class AddPetScreen extends StatelessWidget {
  const AddPetScreen({super.key});
  static const String routeName = '/add-pet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Pet Screen')),
      body: const Center(child: Text('Add Pet Screen')),
    );
  }
}
