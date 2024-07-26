import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/enums/listing/product_condition_type.dart';
import '../../../../../../core/enums/listing/product_privacy_type.dart';
import '../../../../../../core/sources/local/core/local_state.dart';
import '../../../../../../core/utilities/app_validators.dart';
import '../../../../../../core/widgets/custom_textformfield.dart';
import '../../../../../../core/widgets/custom_toggle_switch.dart';
import '../../../data/sources/get_access_code_api.dart';
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
            if (formPro.privacy == ProductPrivacyType.private)
              FutureBuilder<String?>(
                future: GetAccessCodeApi().getCode(oldCode: formPro.accessCode),
                initialData: formPro.accessCode,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<String?> snapshot,
                ) {
                  if (snapshot.hasData && snapshot.data != null) {
                    formPro.setAccessCode(snapshot.data!);
                  }
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Access code: ${snapshot.data ?? '...'}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  );
                },
              ),
          ],
        );
      },
    );
  }
}
