import 'package:flutter/material.dart';

class AddFoodAndDrinkScreen extends StatelessWidget {
  const AddFoodAndDrinkScreen({super.key});
  static const String routeName = '/add-food-drink';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Food And Drink Screen')),
      body: const Center(child: Text('Add Food And Drink Screen')),
    );
  }
}
