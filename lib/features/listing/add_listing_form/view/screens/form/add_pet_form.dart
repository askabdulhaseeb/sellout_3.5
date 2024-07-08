import 'package:flutter/material.dart';

import '../../widgets/add_listing_basic_info_section.dart';
import '../../widgets/add_listing_post_button_widget.dart';
import '../../widgets/add_listing_price_and_quantity_widget.dart';

class AddPetForm extends StatelessWidget {
  const AddPetForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: const <Widget>[
        AddListingBasicInfoSection(),
        AddListingPriceAndQuantityWidget(),
        AddListingPostButtonWidget(),
      ],
    );
  }
}
