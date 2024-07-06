import 'package:flutter/material.dart';

class AddPropertyScreen extends StatelessWidget {
  const AddPropertyScreen({super.key});
  static const String routeName = '/add-property';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Property Screen')),
      body: const Center(child: Text('Add Property Screen')),
    );
  }
}
