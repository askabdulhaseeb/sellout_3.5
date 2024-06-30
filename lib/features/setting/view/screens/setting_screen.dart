import 'package:flutter/material.dart';

import '../../../../core/widgets/coming_soon_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});
  static const String routeName = '/setting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setting')),
      body: const ComingSoonWidget(),
    );
  }
}
