import 'package:flutter/material.dart';

import '../../../../dashboard/view/dashboard_screen.dart';
import '../widgets/welcome_buttons_widget.dart';
import '../widgets/welcome_text_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                DashboardScreen.routeName, (_) => false),
            child: Text(
              'Skip',
              style: TextStyle(color: Theme.of(context).disabledColor),
            ),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            WelcomeTextWidget(),
            WelcomeButtonsWidget(),
          ],
        ),
      ),
    );
  }
}
