import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../listing/add_listing/view/screens/add_listing_screen.dart';
import '../../../chat/view/screens/chat_screen.dart';
import '../../../explore/view/screens/explore_screen.dart';
import '../../../home/view/screens/home_screen.dart';
import '../../../profile/view/screens/profile_screen.dart';
import '../providers/app_nav_bar_provider.dart';
import '../widgets/dashboard_appbar_widget.dart';
import '../widgets/dashboard_nav_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static const String routeName = '/dashboard';

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    ExploreScreen(),
    AddListingScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppbarWidget(),
      body: Consumer<AppNavBarProvider>(
          builder: (BuildContext context, AppNavBarProvider navPro, _) {
        return _screens[navPro.currentNavItem.kIndex];
      }),
      bottomNavigationBar: const DashboardNavBarWidget(),
    );
  }
}
