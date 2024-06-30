import 'package:flutter/material.dart';

import '../../../../core/widgets/coming_soon_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: const ComingSoonWidget(),
    );
  }
}
