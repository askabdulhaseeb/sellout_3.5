import 'package:flutter/material.dart';

class DashboardAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const DashboardAppbarWidget({super.key})
      : preferredSize = const Size.fromHeight(56.0);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'AppBarScreen',
      ),
      leading: IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () => Navigator.of(context).pop(),
      ),
      automaticallyImplyLeading: true,
    );
  }
}
