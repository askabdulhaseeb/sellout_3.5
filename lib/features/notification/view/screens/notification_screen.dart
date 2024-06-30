import 'package:flutter/material.dart';

import '../../../../core/widgets/coming_soon_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static const String routeName = '/notification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification')),
      body: const ComingSoonWidget(),
    );
  }
}
