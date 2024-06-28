import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_elevation_button.dart';
import '../../../signin/view/screens/signin_screen.dart';

class WelcomeButtonsWidget extends StatelessWidget {
  const WelcomeButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomElevatedButton(
          title: 'Log in',
          onTap: () => Navigator.of(context).pushNamed(SigninScreen.routeName),
          isLoading: false,
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
  }
}
