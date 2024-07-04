enum ProductDeliveryTypeEnum {
  delivery('Delivery', 'delivery'),
  collocation('Collection', 'collection'),
  both('Both', 'both');

  const ProductDeliveryTypeEnum(this.title, this.json);
  final String title;
  final String json;

  static ProductDeliveryTypeEnum? fromJson(String? json) {
    if (json == null) return null;
    for (final ProductDeliveryTypeEnum item in ProductDeliveryTypeEnum.values) {
      if (item.json == json) return item;
    }
    return null;
  }

  static List<ProductDeliveryTypeEnum> get list =>
      ProductDeliveryTypeEnum.values;
}
