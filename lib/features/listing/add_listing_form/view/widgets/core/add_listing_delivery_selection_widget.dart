import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/enums/listing/product_delivery_type.dart';
import '../../../../../../core/sources/local/core/local_state.dart';
import '../../../../../../core/widgets/custom_radio_button_list_tile.dart';
import '../../../../../../core/widgets/custom_textformfield.dart';
import '../../../../../../core/widgets/location_input_button.dart';
import '../../providers/add_listing_form_provider.dart';

class AddListingDeliverySelectionWidget extends StatelessWidget {
  const AddListingDeliverySelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddListingFormProvider>(
        builder: (BuildContext context, AddListingFormProvider formPro, _) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 8),
          const Text(
            'Delivery',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          CustomRadioButtonListTile<ProductDeliveryType>(
            title: ProductDeliveryType.freeDelivery.title,
            selectedValue: formPro.deliveryType,
            value: ProductDeliveryType.freeDelivery,
            onChanged: formPro.setDeliveryType,
          ),
          CustomRadioButtonListTile<ProductDeliveryType>(
            title: ProductDeliveryType.delivery.title,
            selectedValue: formPro.deliveryType,
            value: ProductDeliveryType.delivery,
            onChanged: formPro.setDeliveryType,
            subtitle: CustomTextFormField(
              controller: formPro.deliveryFee,
              keyboardType: TextInputType.number,
              hint: 'Delivery Fee',
              autoFocus: true,
              prefixText: LocalState.getCurrency(),
              contentPadding: EdgeInsets.zero,
              validator: (String? value) =>
                  formPro.deliveryType == ProductDeliveryType.delivery &&
                          (value?.isEmpty ?? true)
                      ? 'Delivery Fee is required'
                      : null,
            ),
          ),
          CustomRadioButtonListTile<ProductDeliveryType>(
            title: ProductDeliveryType.collocation.title,
            selectedValue: formPro.deliveryType,
            value: ProductDeliveryType.collocation,
            onChanged: formPro.setDeliveryType,
            subtitle: LocationInputButton(
              validator: (bool? value) =>
                  formPro.deliveryType == ProductDeliveryType.collocation &&
                          (value == null)
                      ? 'Location is required'
                      : null,
            ),
          ),
        ],
      );
    });
  }
}
