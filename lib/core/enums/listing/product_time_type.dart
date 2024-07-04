enum ProductTimeType {
  newBorn('New Born', 'new_born'),
  k1Week('1 Week', '1_week'),
  k2Week('2 Week', '2_week'),
  k3Week('3 Week', '3_week'),
  k4Week('4 Week', '4_week'),
  k5Week('5 Week', '5_week'),
  k6Week('6 Week', '6_week'),
  k7Week('7 Week', '7_week'),
  k8Week('8 Week', '8_week'),
  k9Week('9 Week', '9_week'),
  k10Week('10 Week', '10_week'),
  k11Week('11 Week', '11_week'),
  k12Week('12 Week', '12_week'),
  k4Month('4 Month', '4_month'),
  k6Month('6 Month', '6_month'),
  k9Month('9 Month', '9_month'),
  k1Year('1 Year', '1_year'),
  k2Year('2 Year', '2_year'),
  k3Year('3 Year', '3_year'),
  k4Year('4 Year', '4_year'),
  k5Year('5 Year', '5_year'),
  k6Year('6 Year', '6_year'),
  k7Year('7 Year', '7_year'),
  k8Year('8 Year', '8_year'),
  k9Year('9 Year', '9_year'),
  k10Year('10 Year', '10_year'),
  others('Others', 'others');

  const ProductTimeType(this.title, this.json);
  final String title;
  final String json;

  static ProductTimeType? fromJson(String? json) {
    if (json == null) return null;
    for (final ProductTimeType item in ProductTimeType.values) {
      if (item.json == json) return item;
    }
    return null;
  }

  static List<ProductTimeType> get list => ProductTimeType.values;
}
