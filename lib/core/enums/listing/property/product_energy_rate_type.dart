enum ProductEnergyRateType {
  k1to20('1 to 20', '1to20'),
  k21to38('21 to 38', '21to38'),
  k39to54('39 to 54', '39to54'),
  k55to68('55 to 68', '55to68'),
  k69to80('69 to 80', '69to80'),
  k81to91('81 to 91', '81to91'),
  k92plus('92 or higher', '92plus');

  const ProductEnergyRateType(this.title, this.json);
  final String title;
  final String json;

  static ProductEnergyRateType? fromJson(String? json) {
    if (json == null) return null;
    for (final ProductEnergyRateType item in ProductEnergyRateType.values) {
      if (item.json == json) return item;
    }
    return null;
  }

  static List<ProductEnergyRateType> get list => ProductEnergyRateType.values;
}
