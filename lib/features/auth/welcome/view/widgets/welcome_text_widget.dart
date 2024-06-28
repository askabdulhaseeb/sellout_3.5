import 'package:flutter/material.dart';

import '../../../../../core/utilities/app_images.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: Image.asset(AppImages.logo),
        ),
        Text(
          'SellOut',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const Opacity(
          opacity: 0.7,
          child: Text(
            'SellOut helps you buy & sell and privde services.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
