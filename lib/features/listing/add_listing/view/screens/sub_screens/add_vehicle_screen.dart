import 'package:flutter/material.dart';

class AddVehicleScreen extends StatelessWidget {
  const AddVehicleScreen({super.key});
  static const String routeName = '/add-vehicle';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Vehicle Screen')),
      body: const Center(child: Text('Add Vehicle Screen')),
    );
  }
}
