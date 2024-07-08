import 'package:flutter/material.dart';

import '../../widgets/core/add_listing_basic_info_section.dart';
import '../../widgets/core/add_listing_condition_offer_section.dart';
import '../../widgets/core/add_listing_post_button_widget.dart';
import '../../widgets/property/add_listing_property_bed_bath_widget.dart';
import '../../widgets/property/add_property_gpa_widget.dart';

class AddPropertyForm extends StatelessWidget {
  const AddPropertyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: const <Widget>[
        AddListingBasicInfoSection(),
        // TODO: Category selection widget
        AddListingPropertyBedBathWidget(),
        AddPropertyGPAWidget(),
        AddListingConditionOfferSection(),
        AddListingPostButtonWidget(),
      ],
    );
  }
}