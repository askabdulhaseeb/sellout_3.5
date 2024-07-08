import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/add_listing_form_provider.dart';
import '../../widgets/add_listing_basic_info_section.dart';
import '../../widgets/add_listing_condition_offer_section.dart';
import '../../widgets/add_listing_delivery_selection_widget.dart';
import '../../widgets/add_listing_post_button_widget.dart';
import '../../widgets/add_listing_price_and_quantity_widget.dart';

class AddItemForm extends StatelessWidget {
  const AddItemForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddListingFormProvider>(
      builder: (BuildContext context, AddListingFormProvider formPro, _) {
        return ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: const <Widget>[
            AddListingBasicInfoSection(),
            AddListingPriceAndQuantityWidget(),
            AddListingConditionOfferSection(),
            AddListingDeliverySelectionWidget(),
            AddListingPostButtonWidget(),
          ],
        );
      },
    );
  }
}
