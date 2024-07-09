import 'package:flutter/material.dart';

import '../../../../../core/enums/core/attachment_type.dart';
import '../../../../../core/enums/listing/listing_type.dart';
import '../../../../../core/enums/listing/product_condition_type.dart';
import '../../../../../core/enums/listing/product_delivery_type.dart';
import '../../../../../core/enums/listing/product_privacy_type.dart';
import '../../../../../core/enums/listing/pet/product_time_type.dart';
import '../../../../../core/enums/listing/vehicle/transmission_type.dart';
import '../../../../attachment_selection/selectable_attachment/domain/pickable_attachment_option.dart';
import '../../../../attachment_selection/selectable_attachment/domain/picked_attachment.dart';
import '../../../../attachment_selection/selectable_attachment/screens/pickable_attachment_screen.dart';

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

  Future<void> setImages(
    BuildContext context, {
    required AttachmentType type,
  }) async {
    final List<PickedAttachment>? files =
        await Navigator.of(context).push<List<PickedAttachment>>(
      MaterialPageRoute<List<PickedAttachment>>(builder: (_) {
        return PickableAttachmentScreen(
          option: PickableAttachmentOption(
            maxAttachments: 10,
            allowMultiple: true,
            type: type,
          ),
        );
      }),
    );
    if (files != null) {
      _attachments.addAll(files);
    }
    notifyListeners();
  }

  void removeAttachment(PickedAttachment attachment) {
    _attachments.remove(attachment);
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

  // Vehicle
  void setTransmissionType(TransmissionType? value) {
    if (value == null) return;
    _transmissionType = value;
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
  List<PickedAttachment> get attachments => _attachments;
  ProductConditionType get condition => _condition;
  bool get acceptOffer => _acceptOffer;
  ProductPrivacyType get privacy => _privacy;
  ProductDeliveryType get deliveryType => _deliveryType;
  // Vehicle
  TransmissionType get transmissionType => _transmissionType;
  TextEditingController get engineSize => _engineSize;
  TextEditingController get mileage => _mileage;
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
  // Selected Category
  // Size and Color
  ProductConditionType _condition = ProductConditionType.newC;
  bool _acceptOffer = true;
  ProductPrivacyType _privacy = ProductPrivacyType.public;
  ProductDeliveryType _deliveryType = ProductDeliveryType.delivery;
  // Vehicle
  TransmissionType _transmissionType = TransmissionType.auto;
  final TextEditingController _engineSize = TextEditingController();
  final TextEditingController _mileage = TextEditingController();

  // Property
  final TextEditingController _bedroom = TextEditingController();
  final TextEditingController _bathroom = TextEditingController();
  bool _garden = true;
  bool _parking = true;
  bool _animalFriendly = true;
  // Pet
  ProductTimeType? _age;
  ProductTimeType _time = ProductTimeType.readyToLeave;
  bool _isLoading = false;
  //
  List<PickedAttachment> _attachments = <PickedAttachment>[];
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _quantity = TextEditingController(text: '1');
  final TextEditingController _minimumOffer = TextEditingController();
  final TextEditingController _deliveryFee = TextEditingController();
}
