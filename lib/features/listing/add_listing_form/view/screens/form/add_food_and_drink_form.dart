import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/add_listing_form_provider.dart';
import '../../widgets/add_listing_price_and_quantity_widget.dart';
import '../../widgets/core/add_listing_basic_info_section.dart';
import '../../widgets/core/add_listing_condition_offer_section.dart';
import '../../widgets/core/add_listing_delivery_selection_widget.dart';
import '../../widgets/core/add_listing_post_button_widget.dart';

class AddFoodAndDrinkForm extends StatelessWidget {
  const AddFoodAndDrinkForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: Provider.of<AddListingFormProvider>(context).foodAndDrinkKey,
      child: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: const <Widget>[
          AddListingBasicInfoSection(),
          // TODO: Category selection widget
          AddListingPriceAndQuantityWidget(),
          AddListingConditionOfferSection(),
          AddListingDeliverySelectionWidget(),
          AddListingPostButtonWidget(),
        ],
      ),
    );
  }
}
