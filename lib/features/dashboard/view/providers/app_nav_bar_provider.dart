import 'package:flutter/material.dart';

import '../../../../core/enums/core/nav_item_type.dart';

class AppNavBarProvider extends ChangeNotifier {
  NavItemType _currentNavItem = NavItemType.home;

  NavItemType get currentNavItem => _currentNavItem;

  void updateCurrentIndex(int value) {
    _currentNavItem = NavItemType.fromIndex(value);
    debugPrint('New Index: $value Nav Item: $_currentNavItem');
    notifyListeners();
  }
}
