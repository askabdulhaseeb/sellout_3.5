import 'package:flutter/material.dart';

import '../../../../core/utilities/app_icons_icons.dart';
import '../../../../core/widgets/custom_icon_button.dart';

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
            onPressed: () {
              // TODO: Navigate to Setting Screen
            },
          ),
          CustomIconButton(
            icon: AppIcons.search,
            onPressed: () {
              // TODO: Navigate to Search Screen
            },
          ),
        ],
      ),
      actions: <Widget>[
        CustomIconButton(
          icon: AppIcons.notification,
          onPressed: () {
            // TODO: Navigate to Notification Screen
          },
        ),
        CustomIconButton(
          icon: AppIcons.cart,
          onPressed: () {
            // TODO: Navigate to Cart Screen
          },
        ),
        const SizedBox(width: 6),
      ],
    );
  }
}
