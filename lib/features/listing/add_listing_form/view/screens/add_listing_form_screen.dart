import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/enums/listing/listing_type.dart';
import '../providers/add_listing_form_provider.dart';
import 'form/add_cloths_and_footwear_form.dart';
import 'form/add_food_and_drink_form.dart';
import 'form/add_item_form.dart';
import 'form/add_pet_form.dart';
import 'form/add_property_form.dart';
import 'form/add_vehicle_form.dart';

class AddListingFormScreen extends StatelessWidget {
  const AddListingFormScreen({super.key});
  static const String routeName = '/add-listing-form';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Provider.of<AddListingFormProvider>(context, listen: false)
                  .listingType
                  ?.display ??
              'Select Type',
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Consumer<AddListingFormProvider>(
          builder: (BuildContext context, AddListingFormProvider formPro, _) {
            switch (formPro.listingType) {
              case ListingType.item:
                return const AddItemForm();
              case ListingType.clothesAndFoot:
                return const AddClothsAndFootwearForm();
              case ListingType.vehicles:
                return const AddVehicleForm();
              case ListingType.foodAndDrinks:
                return const AddFoodAndDrinkForm();
              case ListingType.properties:
                return const AddPropertyForm();
              case ListingType.pet:
                return const AddPetForm();
              default:
                return const AddItemForm();
            }
          },
        ),
      ),
    );
  }
}
