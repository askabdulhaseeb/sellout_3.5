import 'package:flutter/material.dart';

import '../../../../core/widgets/coming_soon_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Screen')),
      body: const ComingSoonWidget(),
    );
  }
}
