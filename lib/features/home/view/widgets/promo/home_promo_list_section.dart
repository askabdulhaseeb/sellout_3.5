import 'package:flutter/material.dart';

import '../../../../../core/widgets/loader.dart';
import 'widgets/home_add_promo_widget.dart';
import 'widgets/home_promo_card_widget.dart';

class HomePromoListSection extends StatefulWidget {
  const HomePromoListSection({super.key});

  @override
  State<HomePromoListSection> createState() => _HomePromoListSectionState();
}

class _HomePromoListSectionState extends State<HomePromoListSection> {
  Future<int> _fetchPromos() async {
    await Future<int>.delayed(const Duration(seconds: 2), () => 1);
    return 5;
  }

  @override
  Widget build(BuildContext context) {
    const double height = 120;
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Row(
        children: <Widget>[
          const SizedBox(width: 16),
          const HomeAddPromoWidget(),
          const SizedBox(width: 8),
          Expanded(
            child: FutureBuilder<int>(
              future: _fetchPromos(),
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? const Loader()
                    : ListView.builder(
                        itemCount: 20,
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return HomePromoCardWidget(index: index);
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
