import 'package:flutter/material.dart';

import '../../../../core/widgets/sellout_title.dart';
import '../widgets/promo/home_promo_list_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SellOutTitle(),
            ),
            HomePromoListSection(),
          ],
        ),
      ),
    );
  }
}
