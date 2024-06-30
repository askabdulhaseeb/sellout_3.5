import 'package:flutter/material.dart';

import '../../../../core/widgets/coming_soon_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static const String routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: const ComingSoonWidget(),
    );
  }
}
