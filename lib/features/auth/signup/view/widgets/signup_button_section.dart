import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_elevation_button.dart';
import '../providers/signup_provider.dart';

class SignupButtonSection extends StatelessWidget {
  const SignupButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProvider>(
      builder: (BuildContext context, SignupProvider signupPro, _) {
        return Column(
          children: <Widget>[
            const SizedBox(height: 16),
            CustomElevatedButton(
              title: 'Continue',
              isLoading: signupPro.isLoading,
              onTap: () => signupPro.onSignup(context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).disabledColor,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'By registering, you agree to our ',
                    ),
                    TextSpan(
                      text: 'Customer Agreement Conditions',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // TODO: Redirect to Customer Agreement Conditions
                        },
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // TODO: Redirect to Privacy Policy
                        },
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
