enum ProductConditionType {
  newC('New', 'new'),
  used('Used', 'used');

  const ProductConditionType(this.title, this.json);
  final String title;
  final String json;

  static ProductConditionType? fromJson(String? json) {
    if (json == null) return null;
    for (final ProductConditionType item in ProductConditionType.values) {
      if (item.json == json) return item;
    }
    return null;
  }

  static List<ProductConditionType> get list => ProductConditionType.values;
}
