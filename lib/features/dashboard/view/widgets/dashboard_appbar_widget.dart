import 'package:flutter/material.dart';

import '../../../../core/utilities/app_icons_icons.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../../../cart/view/screens/cart_screen.dart';
import '../../../notification/view/screens/notification_screen.dart';
import '../../../search/view/screens/search_screen.dart';
import '../../../setting/view/screens/setting_screen.dart';

class DashboardAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const DashboardAppbarWidget({super.key})
      : preferredSize = const Size.fromHeight(56.0);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Row(
        children: <Widget>[
          CustomIconButton(
            icon: AppIcons.setting,
            onPressed: () =>
                Navigator.of(context).pushNamed(SettingScreen.routeName),
          ),
          CustomIconButton(
            icon: AppIcons.search,
            onPressed: () =>
                Navigator.of(context).pushNamed(SearchScreen.routeName),
          ),
        ],
      ),
      actions: <Widget>[
        CustomIconButton(
          icon: AppIcons.notification,
          onPressed: () =>
              Navigator.of(context).pushNamed(NotificationScreen.routeName),
        ),
        CustomIconButton(
          icon: AppIcons.cart,
          onPressed: () =>
              Navigator.of(context).pushNamed(CartScreen.routeName),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
