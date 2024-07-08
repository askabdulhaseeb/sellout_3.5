import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/sources/local/core/local_state.dart';
import '../../../../../core/utilities/app_validators.dart';
import '../../../../../core/widgets/custom_textformfield.dart';
import '../providers/add_listing_form_provider.dart';

class AddListingPriceAndQuantityWidget extends StatelessWidget {
  const AddListingPriceAndQuantityWidget({this.readOnly = false, super.key});
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Consumer<AddListingFormProvider>(
      builder: (BuildContext context, AddListingFormProvider formPro, _) {
        final bool isLoading = readOnly || formPro.isLoading;
        return Row(
          children: <Widget>[
            Expanded(
              child: CustomTextFormField(
                controller: formPro.price,
                labelText: 'Price',
                hint: '12.0',
                showSuffixIcon: false,
                readOnly: isLoading,
                prefixText: LocalState.getCurrency(),
                keyboardType: TextInputType.number,
                validator: (String? value) => AppValidator.isEmpty(value),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomTextFormField(
                controller: formPro.quantity,
                labelText: 'Quantity',
                showSuffixIcon: false,
                hint: '12.0',
                readOnly: isLoading,
                textAlign: TextAlign.center,
                prefixIcon: IconButton(
                  onPressed: isLoading ? null : formPro.decrementQuantity,
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: formPro.quantity.text == '1'
                        ? Theme.of(context).shadowColor
                        : null,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: isLoading ? null : formPro.incrementQuantity,
                  icon: Icon(
                    Icons.add_circle_outline_outlined,
                    color: isLoading ? null : Theme.of(context).primaryColor,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        );
      },
    );
  }
}
