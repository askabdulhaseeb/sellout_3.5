import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/enums/listing/product_time_type.dart';
import '../../../../../../core/widgets/custom_dropdown_widget.dart';
import '../../providers/add_listing_form_provider.dart';

class AddListingPetAgeLeaveWidget extends StatelessWidget {
  const AddListingPetAgeLeaveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductTimeType> age = ProductTimeType.age;
    final List<ProductTimeType> time = ProductTimeType.time;
    return Consumer<AddListingFormProvider>(
      builder: (BuildContext context, AddListingFormProvider formPro, _) {
        return Row(
          children: <Widget>[
            Expanded(
              child: CustomDropdown<ProductTimeType>(
                selectedItem: formPro.age,
                items: age.map((ProductTimeType value) {
                  return DropdownMenuItem<ProductTimeType>(
                    value: value,
                    child: Text(value.title),
                  );
                }).toList(),
                onChanged: formPro.setAge,
                title: 'Age',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomDropdown<ProductTimeType>(
                selectedItem: formPro.time,
                items: time.map((ProductTimeType value) {
                  return DropdownMenuItem<ProductTimeType>(
                    value: value,
                    child: Text(value.title),
                  );
                }).toList(),
                onChanged: formPro.setTime,
                title: 'Ready to Leave',
              ),
            ),
          ],
        );
      },
    );
  }
}
