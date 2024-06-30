import 'package:flutter/material.dart';

import '../../../../core/widgets/coming_soon_widget.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});
  static const String routeName = '/explore';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explore Screen')),
      body: const ComingSoonWidget(),
    );
  }
}
