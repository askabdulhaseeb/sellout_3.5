import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/enums/listing/listing_type.dart';
import '../../../../../../core/sources/local/local_listing.dart';
import '../../../../../../core/utilities/app_snakebar.dart';
import '../../../../../../core/widgets/loader.dart';
import '../../../../add_listing/data/sources/listing_api.dart';
import '../../../../add_listing/domain/entities/listing_entity.dart';
import '../../../../add_listing/domain/entities/sub_category_entity.dart';
import 'category_selection_bottom_sheet.dart';

class SubCategorySelectableWidget extends StatelessWidget {
  const SubCategorySelectableWidget({
    required this.listType,
    required this.subCategory,
    required this.onSelected,
    super.key,
  });
  final ListingType? listType;
  final SubCategoryEntity? subCategory;
  final void Function(SubCategoryEntity?) onSelected;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ListingEntity>>(
        future: ListingAPI().listing(),
        initialData: LocalListing().listings,
        builder: (
          BuildContext context,
          AsyncSnapshot<List<ListingEntity>> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              kDebugMode) {
            return const Loader();
          }
          if (snapshot.hasError && snapshot.data == null) {
            log('❌ Error: SubCategorySelectableWidget: snapshot -> ${snapshot.error}');
            return const Center(child: Text('An error occurred'));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Category',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),
              InkWell(
                onTap: () async {
                  final List<ListingEntity> selectedList = snapshot.data
                          ?.where((ListingEntity element) =>
                              element.type == listType)
                          .toList() ??
                      <ListingEntity>[];
                  if (selectedList.isEmpty) {
                    AppSnackBar.showSnackBar(context, 'Something went wrong');
                    return;
                  }
                  final SubCategoryEntity? selectCat =
                      await showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return CategorySelectionBottomSheet(
                        subCategories: selectedList.first.subCategory,
                      );
                    },
                  );
                  if (selectCat != null) {
                    onSelected(selectCat);
                  }
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: <Widget>[
                      subCategory == null
                          ? Text(
                              subCategory?.title ?? 'Select a sub category',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            )
                          : Text(subCategory?.title ?? 'Null Title'),
                      const Spacer(),
                      const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
