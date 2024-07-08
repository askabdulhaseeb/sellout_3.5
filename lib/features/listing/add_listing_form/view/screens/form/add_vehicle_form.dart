import 'package:flutter/material.dart';

import '../../widgets/core/add_listing_basic_info_section.dart';
import '../../widgets/core/add_listing_condition_offer_section.dart';
import '../../widgets/core/add_listing_post_button_widget.dart';
import '../../widgets/vehicle/add_listing_vehicle_ternsmission_engine_mileage_section.dart';

class AddVehicleForm extends StatelessWidget {
  const AddVehicleForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: const <Widget>[
        AddListingBasicInfoSection(),
        // TODO: Category selection widget
        AddListingVehicleTernsmissionEngineMileageSection(),
        AddListingConditionOfferSection(),
        AddListingPostButtonWidget(),
      ],
    );
  }
}
