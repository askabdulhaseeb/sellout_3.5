import 'package:flutter/material.dart';

import 'features/auth/signin/view/screens/signin_screen.dart';
import 'features/auth/welcome/view/screens/welcome_screen.dart';
import 'features/dashboard/view/dashboard_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  WelcomeScreen.routeName: (_) => const WelcomeScreen(),
  SigninScreen.routeName: (_) => const SigninScreen(),

  //
  DashboardScreen.routeName: (_) => const DashboardScreen(),
};
