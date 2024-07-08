import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utilities/app_validators.dart';
import '../../../../../../core/widgets/custom_textformfield.dart';
import '../../providers/add_listing_form_provider.dart';
import '../../widgets/core/add_listing_basic_info_section.dart';
import '../../widgets/core/add_listing_post_button_widget.dart';
import '../../widgets/add_listing_price_and_quantity_widget.dart';

class AddClothsAndFootwearForm extends StatelessWidget {
  const AddClothsAndFootwearForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddListingFormProvider>(
      builder: (BuildContext context, AddListingFormProvider formPro, _) {
        return ListView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: <Widget>[
            const AddListingBasicInfoSection(),
            const AddListingPriceAndQuantityWidget(readOnly: true),
            CustomTextFormField(
              controller: formPro.quantity,
              labelText: 'Minimum offerd amount',
              showSuffixIcon: false,
              keyboardType: TextInputType.number,
              validator: (String? value) => AppValidator.isEmpty(value),
            ),
            const AddListingPostButtonWidget(),
          ],
        );
      },
    );
  }
}
