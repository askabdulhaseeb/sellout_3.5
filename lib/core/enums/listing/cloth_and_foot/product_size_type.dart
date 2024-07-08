enum ProductSizeType {
  one('one', 'One Size'),
  xxs('xxs', 'Double Extra Small'),
  xs('xs', 'Extra Small'),
  s('s', 'Small'),
  m('m', 'Medium'),
  l('l', 'Large'),
  xl('xl', 'Extra Large'),
  xxl('xxl', 'Double Extra Large'),
  xxxl('xxxl', 'Triple Extra Large'),
  xxxxl('xxxxl', 'Full Size'),
  other('other', 'Other');

  const ProductSizeType(this.sign, this.title);
  final String sign;
  final String title;

  static ProductSizeType? fromJson(String? json) {
    if (json == null) return null;
    for (final ProductSizeType item in ProductSizeType.values) {
      if (item.sign == json) return item;
    }
    return null;
  }

  static List<ProductSizeType> get list => ProductSizeType.values;
}
