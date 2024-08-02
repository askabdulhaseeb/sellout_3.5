enum ProductDeliveryType {
  paid('Paid Delivery', 'paid'),
  freeDelivery('Free Delivery', 'free'),
  collocation('Collection', 'collection');

  const ProductDeliveryType(this.title, this.json);
  final String title;
  final String json;

  static ProductDeliveryType? fromJson(String? json) {
    if (json == null) return null;
    for (final ProductDeliveryType item in ProductDeliveryType.values) {
      if (item.json == json) return item;
    }
    return null;
  }

  static List<ProductDeliveryType> get list => ProductDeliveryType.values;
}
