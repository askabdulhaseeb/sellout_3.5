import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/enums/listing/listing_type.dart';
import '../../../../../core/enums/listing/product_condition_type.dart';
import '../../../../../core/enums/listing/product_delivery_type.dart';
import '../../../../../core/enums/listing/product_privacy_type.dart';
import '../../../../../core/enums/listing/product_time_type.dart';

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

  // Property
  void setGarden(bool? value) {
    if (value == null) return;
    _garden = value;
    notifyListeners();
  }

  void setParking(bool? value) {
    if (value == null) return;
    _parking = value;
    notifyListeners();
  }

  void setAnimalFriendly(bool? value) {
    if (value == null) return;
    _animalFriendly = value;
    notifyListeners();
  }

  // Pet
  void setAge(ProductTimeType? value) {
    if (value == null) return;
    _age = value;
    notifyListeners();
  }

  void setTime(ProductTimeType? value) {
    if (value == null) return;
    _time = value;
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
  // Property
  TextEditingController get bedroom => _bedroom;
  TextEditingController get bathroom => _bathroom;
  bool get garden => _garden;
  bool get parking => _parking;
  bool get animalFriendly => _animalFriendly;
  // Pet
  ProductTimeType? get age => _age;
  ProductTimeType get time => _time;

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
  // Property
  TextEditingController _bedroom = TextEditingController();
  TextEditingController _bathroom = TextEditingController();
  bool _garden = true;
  bool _parking = true;
  bool _animalFriendly = true;
  // Pet
  ProductTimeType? _age;
  ProductTimeType _time = ProductTimeType.readyToLeave;
  bool _isLoading = false;
  //
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _quantity = TextEditingController(text: '1');
  final TextEditingController _minimumOffer = TextEditingController();
  final TextEditingController _deliveryFee = TextEditingController();
}
