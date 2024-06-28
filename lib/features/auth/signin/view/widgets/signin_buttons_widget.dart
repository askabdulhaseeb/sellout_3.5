import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_elevation_button.dart';
import '../providers/signin_provider.dart';

class SigninButtonWidget extends StatelessWidget {
  const SigninButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SigninProvider>(
        builder: (BuildContext context, SigninProvider signinPro, _) {
      return Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // TODO: Implement Forgot Password
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: Theme.of(context).disabledColor),
              ),
            ),
          ),
          CustomElevatedButton(
            title: 'Login',
            isLoading: signinPro.isLoading,
            onTap: () => signinPro.signin(context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              '''Don't have an account?''',
              style: TextStyle(color: Theme.of(context).dividerColor),
            ),
          ),
          CustomElevatedButton(
            title: 'Create an account',
            onTap: () {
              // TODO: Implement Create an account
            },
            isLoading: false,
            border: Border.all(),
            bgColor: Colors.transparent,
          ),
        ],
      );
    });
  }
}
