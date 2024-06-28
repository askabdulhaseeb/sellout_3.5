import 'package:flutter/material.dart';

import '../../../../../core/widgets/sellout_title.dart';
import '../../../../dashboard/view/screens/dashboard_screen.dart';
import '../widgets/signin_buttons_widget.dart';
import '../widgets/signin_form_widget.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});
  static const String routeName = '/signin';

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SellOutTitle(),
              SizedBox(height: 24),
              SigninFormWidget(),
              SigninButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
