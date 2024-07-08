import 'package:flutter/cupertino.dart';

import '../../utilities/app_icons_icons.dart';

enum ProductPrivacyType {
  public('Public', 'public', AppIcons.public),
  supporters('Supporters', 'supporters', CupertinoIcons.person_3_fill),
  private('Private', 'private', CupertinoIcons.eye_slash);

  const ProductPrivacyType(this.title, this.json, this.icon);
  final String title;
  final String json;
  final IconData icon;

  static ProductPrivacyType? fromJson(String? json) =>
      ProductPrivacyType.values.firstWhere(
        (ProductPrivacyType e) => e.json == json,
        orElse: () => ProductPrivacyType.public,
      );

  static List<ProductPrivacyType> get list => ProductPrivacyType.values;

  static List<IconData> get icons => <IconData>[
        ProductPrivacyType.public.icon,
        ProductPrivacyType.supporters.icon,
        ProductPrivacyType.private.icon,
      ];
}
