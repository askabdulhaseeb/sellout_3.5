enum ProductDeliveryType {
  delivery('Paid Delivery', 'delivery'),
  freeDelivery('Free Delivery', 'free_delivery'),
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
