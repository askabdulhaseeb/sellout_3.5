import 'package:flutter/material.dart';

import '../../../../add_listing/domain/entities/sub_category_entity.dart';

class CategorySelectionBottomSheet extends StatefulWidget {
  const CategorySelectionBottomSheet({required this.subCategories, super.key});
  final List<SubCategoryEntity> subCategories;

  @override
  State<CategorySelectionBottomSheet> createState() =>
      _CategorySelectionBottomSheetState();
}

class _CategorySelectionBottomSheetState
    extends State<CategorySelectionBottomSheet> {
  SubCategoryEntity? selectedSubCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 8),
          selectedSubCategory == null
              ? const Opacity(
                  opacity: 0.5,
                  child: Text(
                    'Select a category',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Text(selectedSubCategory?.address ?? ''),
          //
          const Divider(),
          //
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: selectedSubCategory?.subCategory.length ??
                  widget.subCategories.length,
              itemBuilder: (BuildContext context, int index) {
                final SubCategoryEntity subCategory =
                    selectedSubCategory?.subCategory[index] ??
                        widget.subCategories[index];
                return ListTile(
                  onTap: () {
                    setState(() {
                      selectedSubCategory = subCategory;
                    });
                  },
                  title: Text(subCategory.address ?? ''),
                  trailing: subCategory.subCategory.isEmpty
                      ? const SizedBox()
                      : const Icon(Icons.arrow_forward_ios),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
