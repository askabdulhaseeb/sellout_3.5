import '../../../../../core/enums/listing/product_delivery_type.dart';
import '../../../../../core/enums/listing/product_privacy_type.dart';
import '../../../../../core/sources/local/auth/local_auth.dart';
import '../../../../../core/sources/local/core/local_state.dart';
import '../../../../attachment_selection/selectable_attachment/domain/picked_attachment.dart';

class AddListingParam {
  AddListingParam({
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.discount,
    required this.disc2Items,
    required this.disc3Items,
    required this.disc5Items,
    required this.itemCondition,
    required this.acceptOffers,
    required this.minOfferAmount,
    required this.privacy,
    required this.accessCode,
    required this.deliveryType,
    required this.localDelivery,
    required this.internationalDelivery,
    required this.listId,
    required this.address,
    required this.currentLatitude,
    required this.currentLongitude,
    required this.attachments,
    this.createdBy,
    this.currency,
  });

  final String title;
  final String description;
  final String price;
  final String quantity;
  final bool discount;
  final String disc2Items;
  final String disc3Items;
  final String disc5Items;
  final String itemCondition;
  final bool acceptOffers;
  final String minOfferAmount;
  final ProductPrivacyType privacy;
  final String accessCode;
  final ProductDeliveryType deliveryType;
  final String localDelivery;
  final String internationalDelivery;
  final String listId;
  final String address;
  final String? createdBy;
  final String? currency;
  final String currentLatitude;
  final String currentLongitude;
  final List<PickedAttachment> attachments;

  //
  String get getCreatedBy => createdBy ?? LocalAuth.uid ?? '';
  String get getCurrency => currency ?? LocalState.getCurrency();

  Map<String, String> itemBody() {
    return <String, String>{
      'title': title,
      'description': description,
      'price': price,
      'quantity': quantity,
      'discount': !discount ? 'true' : 'false',
      if (discount) 'disc_2_items': disc2Items,
      if (discount) 'disc_3_items': disc3Items,
      if (discount) 'disc_5_items': disc5Items,
      'item_condition': itemCondition,
      'accept_offers': acceptOffers ? 'yes' : 'no',
      if (acceptOffers) 'min_offer_amount': minOfferAmount,
      'post_privacy': privacy.json,
      if (privacy == ProductPrivacyType.private) 'access_code': accessCode,
      'delivery_type': deliveryType.json,
      if (deliveryType == ProductDeliveryType.paid)
        'local_delivery': localDelivery,
      if (deliveryType == ProductDeliveryType.paid)
        'international_delivery': internationalDelivery,
      'list_id': listId,
      'address': address,
      'created_by': getCreatedBy,
      'currency': getCurrency,
      'current_latitude': currentLatitude,
      'current_longitude': currentLongitude,
    };
  }
}
