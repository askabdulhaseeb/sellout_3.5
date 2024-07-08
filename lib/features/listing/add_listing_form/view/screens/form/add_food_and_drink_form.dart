import 'package:flutter/material.dart';

import '../../widgets/core/add_listing_basic_info_section.dart';
import '../../widgets/core/add_listing_post_button_widget.dart';

class AddFoodAndDrinkForm extends StatelessWidget {
  const AddFoodAndDrinkForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: const <Widget>[
        AddListingBasicInfoSection(),
        AddListingPostButtonWidget(),
      ],
    );
  }
}
