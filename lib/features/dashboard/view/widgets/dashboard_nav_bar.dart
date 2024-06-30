import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/enums/core/nav_item_type.dart';
import '../providers/app_nav_bar_provider.dart';

class DashboardNavBarWidget extends StatelessWidget {
  const DashboardNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const List<NavItemType> navItems = NavItemType.list;
    return Consumer<AppNavBarProvider>(
        builder: (BuildContext context, AppNavBarProvider navPro, _) {
      return BottomNavigationBar(
        items: navItems.map((NavItemType e) {
          return BottomNavigationBarItem(
            icon: Icon(e.icon),
            activeIcon: Icon(e.activeIcon),
            label: e.display,
          );
        }).toList(),
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).unselectedWidgetColor,
        showSelectedLabels: false,
        onTap: (int index) => navPro.updateCurrentIndex(index),
        currentIndex: navPro.currentNavItem.kIndex,
      );
    });
  }
}
