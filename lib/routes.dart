import 'package:flutter/material.dart';

import 'features/auth/account_type_section/view/screens/account_type_selection_screen.dart';
import 'features/auth/phone_number_opt_varification/view/screens/phone_number_opt_varification_screen.dart';
import 'features/auth/signin/view/screens/signin_screen.dart';
import 'features/auth/signup/view/screens/signup_screen.dart';
import 'features/auth/welcome/view/screens/welcome_screen.dart';
import 'features/cart/view/screens/cart_screen.dart';
import 'features/dashboard/view/screens/dashboard_screen.dart';
import 'features/notification/view/screens/notification_screen.dart';
import 'features/search/view/screens/search_screen.dart';
import 'features/setting/view/screens/setting_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  //
  /// AUTH
  WelcomeScreen.routeName: (_) => const WelcomeScreen(),
  SigninScreen.routeName: (_) => const SigninScreen(),
  SignupScreen.routeName: (_) => const SignupScreen(),
  PhoneNumberOtpVarificationScreen.routeName: (_) =>
      const PhoneNumberOtpVarificationScreen(),
  AccountTypeSelectionScreen.routeName: (_) =>
      const AccountTypeSelectionScreen(),
  //
  /// Dashboard
  DashboardScreen.routeName: (_) => const DashboardScreen(),
  SettingScreen.routeName: (_) => const SettingScreen(),
  SearchScreen.routeName: (_) => const SearchScreen(),
  NotificationScreen.routeName: (_) => const NotificationScreen(),
  CartScreen.routeName: (_) => const CartScreen(),
  //
  ///
};
