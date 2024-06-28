import 'package:flutter/material.dart';

import '../../../../../core/widgets/sellout_title.dart';

class PhoneNumberOtpVarificationScreen extends StatelessWidget {
  const PhoneNumberOtpVarificationScreen({super.key});
  static const String routeName = '/phone-number-otp-varification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SellOutTitle()),
      body: Column(
        children: <Widget>[
          Text(
            'Enter 6-digit code',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
