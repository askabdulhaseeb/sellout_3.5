import 'package:flutter/material.dart';

import '../widgets/dashboard_appbar_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static const String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardAppbarWidget(),
    );
  }
}
