import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/enums/listing/product_condition_type.dart';
import '../../../../../../core/enums/listing/product_privacy_type.dart';
import '../../../../../../core/sources/local/core/local_state.dart';
import '../../../../../../core/utilities/app_validators.dart';
import '../../../../../../core/widgets/custom_textformfield.dart';
import '../../../../../../core/widgets/custom_toggle_switch.dart';
import '../../providers/add_listing_form_provider.dart';

class AddListingConditionOfferSection extends StatelessWidget {
  const AddListingConditionOfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddListingFormProvider>(
      builder: (BuildContext context, AddListingFormProvider formPro, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomToggleSwitch<ProductConditionType>(
              labels: ProductConditionType.list,
              labelStrs: ProductConditionType.list
                  .map<String>((ProductConditionType e) => e.title)
                  .toList(),
              labelText: 'Condition',
              initialValue: formPro.condition,
              onToggle: formPro.setCondition,
            ),
            CustomToggleSwitch<bool>(
              labels: const <bool>[true, false],
              labelStrs: const <String>['Yes', 'No'],
              labelText: 'Accept Offers',
              initialValue: formPro.acceptOffer,
              onToggle: formPro.setAcceptOffer,
            ),
            if (formPro.acceptOffer)
              CustomTextFormField(
                controller: formPro.minimumOffer,
                labelText: 'Minimum offerd amount',
                showSuffixIcon: false,
                prefixText: LocalState.getCurrency(),
                hint: '8.0',
                keyboardType: TextInputType.number,
                validator: (String? value) => AppValidator.isEmpty(value),
              ),
            CustomToggleSwitch<ProductPrivacyType>(
              labels: ProductPrivacyType.list,
              labelStrs: ProductPrivacyType.list
                  .map<String>((ProductPrivacyType e) => e.title)
                  .toList(),
              labelText: 'Privacy Type',
              initialValue: formPro.privacy,
              onToggle: formPro.setPrivacy,
            ),
          ],
        );
      },
    );
  }
}
