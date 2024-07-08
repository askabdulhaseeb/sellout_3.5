import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/enums/listing/listing_type.dart';
import '../../../../../core/enums/listing/product_condition_type.dart';
import '../../../../../core/enums/listing/product_privacy_type.dart';

class AddListingFormProvider extends ChangeNotifier {
  //
  /// Setter
  void setListingType(ListingType? value) {
    _listingType = value;
    notifyListeners();
  }

  void setImages(List<File> value) {
    _images = value;
    notifyListeners();
  }

  void setCondition(ProductConditionType value) {
    _condition = value;
    notifyListeners();
  }

  void setAcceptOffer(bool value) {
    _acceptOffer = value;
    notifyListeners();
  }

  void setPrivacy(ProductPrivacyType value) {
    _privacy = value;
    notifyListeners();
  }

  //
  /// Getter
  ListingType? get listingType => _listingType ?? ListingType.item;
  List<File> get images => _images;
  ProductConditionType get condition => _condition;
  bool get acceptOffer => _acceptOffer;
  ProductPrivacyType get privacy => _privacy;
  //
  TextEditingController get title => _title;
  TextEditingController get description => _description;
  TextEditingController get price => _price;
  TextEditingController get quantity => _quantity;
  TextEditingController get minimumOffer => _minimumOffer;
  //
  /// Controller
  ListingType? _listingType;
  List<File> _images = <File>[];
  // Selected Category
  // Size and Color
  ProductConditionType _condition = ProductConditionType.newC;
  bool _acceptOffer = true;
  ProductPrivacyType _privacy = ProductPrivacyType.public;
  //
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _quantity = TextEditingController();
  final TextEditingController _minimumOffer = TextEditingController();
}
