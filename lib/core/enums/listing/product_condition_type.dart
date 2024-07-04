enum ProductConditionEnum {
  newC('New', 'new'),
  used('Used', 'used');

  const ProductConditionEnum(this.title, this.json);
  final String title;
  final String json;

  static ProductConditionEnum? fromJson(String? json) {
    if (json == null) return null;
    for (final ProductConditionEnum item in ProductConditionEnum.values) {
      if (item.json == json) return item;
    }
    return null;
  }

  static List<ProductConditionEnum> get list => ProductConditionEnum.values;
}
