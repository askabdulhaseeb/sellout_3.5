enum UserType {
  personal('personal', 'Personal'),
  business('business', 'Business');

  const UserType(this.json, this.display);
  final String json;
  final String display;

  static UserType fromJson(String? json) {
    if (json == null) return UserType.personal;
    switch (json) {
      case 'personal':
        return UserType.personal;
      case 'business':
        return UserType.business;
      default:
        throw Exception('Unknown UserType: $json');
    }
  }

  static List<UserType> get list => UserType.values.toList();
}
