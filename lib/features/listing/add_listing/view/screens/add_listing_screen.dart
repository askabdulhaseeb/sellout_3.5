import 'package:flutter/material.dart';

import '../../../../../core/enums/listing/listing_type.dart';
import '../widgets/add_listing_type_tile.dart';

class AddListingScreen extends StatelessWidget {
  const AddListingScreen({super.key});
  static const String routeName = '/add-listing';

  @override
  Widget build(BuildContext context) {
    final List<ListingType> listingTypes = ListingType.list;
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Start Selling',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: listingTypes.length,
            primary: false,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final ListingType type = listingTypes[index];
              return AddListingTypeTile(type: type);
            },
          ),
        ),
      ],
    );
  }
}
