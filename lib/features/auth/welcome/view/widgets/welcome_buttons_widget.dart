import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_elevation_button.dart';

class WelcomeButtonsWidget extends StatelessWidget {
  const WelcomeButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomElevatedButton(
          title: 'Log in',
          onTap: () {},
          isLoading: false,
        ),
        CustomElevatedButton(
          title: 'Create an account',
          onTap: () {},
          isLoading: false,
          border: Border.all(),
          bgColor: Colors.transparent,
          
        ),
      ],
    );
  }
}
