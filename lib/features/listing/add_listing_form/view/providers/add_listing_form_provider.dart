import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/enums/listing/listing_type.dart';
import '../../../../../core/enums/listing/product_condition_type.dart';
import '../../../../../core/enums/listing/product_delivery_type.dart';
import '../../../../../core/enums/listing/product_privacy_type.dart';

class AddListingFormProvider extends ChangeNotifier {
  Future<void> submit(BuildContext context) async {
    setLoading(true);
    await Future<void>.delayed(const Duration(seconds: 2));
    setLoading(false);
  }

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

  void incrementQuantity() {
    final int value = int.parse(_quantity.text);
    _quantity.text = (value + 1).toString();
    notifyListeners();
  }

  void decrementQuantity() {
    final int value = int.parse(_quantity.text);
    if (value > 1) {
      _quantity.text = (value - 1).toString();
      notifyListeners();
    }
  }

  void setDeliveryType(ProductDeliveryType? value) {
    if (value == null) return;
    _deliveryType = value;
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //
  /// Getter
  ListingType? get listingType => _listingType ?? ListingType.item;
  List<File> get images => _images;
  ProductConditionType get condition => _condition;
  bool get acceptOffer => _acceptOffer;
  ProductPrivacyType get privacy => _privacy;
  ProductDeliveryType get deliveryType => _deliveryType;
  bool get isLoading => _isLoading;
  //
  TextEditingController get title => _title;
  TextEditingController get description => _description;
  TextEditingController get price => _price;
  TextEditingController get quantity => _quantity;
  TextEditingController get minimumOffer => _minimumOffer;
  TextEditingController get deliveryFee => _deliveryFee;
  //
  /// Controller
  ListingType? _listingType;
  List<File> _images = <File>[];
  // Selected Category
  // Size and Color
  ProductConditionType _condition = ProductConditionType.newC;
  bool _acceptOffer = true;
  ProductPrivacyType _privacy = ProductPrivacyType.public;
  ProductDeliveryType _deliveryType = ProductDeliveryType.delivery;
  bool _isLoading = false;
  //
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _quantity = TextEditingController(text: '1');
  final TextEditingController _minimumOffer = TextEditingController();
  final TextEditingController _deliveryFee = TextEditingController();
}
