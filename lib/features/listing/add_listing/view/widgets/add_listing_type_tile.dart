import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/enums/listing/listing_type.dart';
import '../../../add_listing_form/view/providers/add_listing_form_provider.dart';
import '../../../add_listing_form/view/screens/add_listing_form_screen.dart';

class AddListingTypeTile extends StatelessWidget {
  const AddListingTypeTile({required this.type, super.key});
  final ListingType type;

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = BorderRadius.circular(8);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: radius,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 4,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Material(
        borderRadius: radius,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: InkWell(
          onTap: () {
            Provider.of<AddListingFormProvider>(context, listen: false)
                .setListingType(type);
            Navigator.of(context).pushNamed(AddListingFormScreen.routeName);
          },
          borderRadius: radius,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Theme.of(context).shadowColor,
                  radius: 20,
                  child: Text(
                    type.short,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  type.display,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
