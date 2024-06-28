import 'package:flutter/material.dart';

import '../../../../../core/widgets/sellout_title.dart';
import '../widgets/signup_button_section.dart';
import '../widgets/signup_form_section.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  static const String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SellOutTitle()),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[SignupFormSection(), SignupButtonSection()],
          ),
        ),
      ),
    );
  }
}
