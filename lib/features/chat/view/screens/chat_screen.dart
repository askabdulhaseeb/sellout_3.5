import 'package:flutter/material.dart';

import '../../../../core/widgets/coming_soon_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat Screen')),
      body: const ComingSoonWidget(),
    );
  }
}
