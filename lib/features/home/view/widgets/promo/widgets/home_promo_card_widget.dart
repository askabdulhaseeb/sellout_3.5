import 'package:flutter/material.dart';

import '../../../../../../core/widgets/promo_logo.dart';

class HomePromoCardWidget extends StatelessWidget {
  const HomePromoCardWidget({required this.index, super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AspectRatio(
          aspectRatio: 1 / 1.2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: <Widget>[
                Center(child: Text('Promo $index')),
                const Positioned(top: 0, left: 0, child: ProMoLogo()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
