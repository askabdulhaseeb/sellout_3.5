import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utilities/app_validators.dart';
import '../../../../../../core/widgets/custom_textformfield.dart';
import '../../providers/add_listing_form_provider.dart';
import '../../widgets/attachment_selection/add_listing_attachment_selection_widget.dart';

class AddClothsAndFootwearForm extends StatelessWidget {
  const AddClothsAndFootwearForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddListingFormProvider>(
      builder: (BuildContext context, AddListingFormProvider formPro, _) {
        return ListView(
          children: <Widget>[
            CustomTextFormField(
              controller: formPro.title,
              labelText: 'What are you selling?',
              autoFocus: true,
              showSuffixIcon: true,
              validator: (String? value) => AppValidator.isEmpty(value),
            ),
            const SizedBox(height: 16),
            const AddListingAttachmentSelectionWidget(),
            CustomTextFormField(
              controller: formPro.title,
              isExpanded: true,
              maxLines: 5,
              showSuffixIcon: false,
              labelText: 'Describe your product',
              validator: (String? value) => AppValidator.isEmpty(value),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomTextFormField(
                    controller: formPro.price,
                    labelText: 'Price',
                    showSuffixIcon: false,
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
                    textAlign: TextAlign.center,
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle_outline_outlined),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (String? value) => AppValidator.isEmpty(value),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CustomTextFormField(
                controller: formPro.quantity,
                labelText: 'Minimum offerd amount',
                showSuffixIcon: false,
                keyboardType: TextInputType.number,
                validator: (String? value) => AppValidator.isEmpty(value),
              ),
            ),
          ],
        );
      },
    );
  }
}
