import 'package:flutter/material.dart';

class AddClothsAndFootwearScreen extends StatelessWidget {
  const AddClothsAndFootwearScreen({super.key});
  static const String routeName = '/add-cloths-footwear';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Cloths and Footwear')),
      body: const Center(child: Text('Add Cloths and Footwear Screen')),
    );
  }
}
