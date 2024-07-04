enum ProductPrivacyType {
  public('Public', 'public'),
  supporters('Supporters', 'supporters'),
  private('Private', 'private');

  const ProductPrivacyType(this.title, this.json);
  final String title;
  final String json;
}
