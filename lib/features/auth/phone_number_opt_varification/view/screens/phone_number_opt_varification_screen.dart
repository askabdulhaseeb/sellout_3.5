import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/opt_input_widget.dart';
import '../../../../../core/widgets/sellout_title.dart';
import '../../../signup/view/providers/signup_provider.dart';
import '../widgets/resent_opt_widget.dart';

class PhoneNumberOtpVarificationScreen extends StatelessWidget {
  const PhoneNumberOtpVarificationScreen({super.key});
  static const String routeName = '/phone-number-otp-varification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SellOutTitle()),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<SignupProvider>(
            builder: (BuildContext context, SignupProvider signupPro, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Enter 6-digit code',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 6),
              Text(
                'Your code was sent to ${signupPro.phoneNumber?.completeNumber}',
              ),
              const SizedBox(height: 16),
              OtpInputWidget(
                onSubmit: (String value) =>
                    Provider.of<SignupProvider>(context, listen: false)
                        .onOtpVarification(context, value: value),
              ),
              const SizedBox(height: 12),
              const ResetOtpWidget(),
            ],
          );
        }),
      ),
    );
  }
}
