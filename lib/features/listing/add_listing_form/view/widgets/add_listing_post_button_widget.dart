import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_elevation_button.dart';
import '../providers/add_listing_form_provider.dart';

class AddListingPostButtonWidget extends StatelessWidget {
  const AddListingPostButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddListingFormProvider>(
        builder: (BuildContext context, AddListingFormProvider formPro, _) {
      return Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(12),
            child: Opacity(
              opacity: 0.5,
              child: Text(
                'Please note that delivery must be tracked and signed for. Thank You',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          CustomElevatedButton(
            title: 'Post',
            isLoading: formPro.isLoading,
            onTap: () async => await formPro.submit(context),
          ),
          const SizedBox(height: 240),
        ],
      );
    });
  }
}
