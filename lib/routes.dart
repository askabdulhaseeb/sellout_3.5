import 'package:flutter/material.dart';

import 'features/auth/account_type_section/view/screens/account_type_selection_screen.dart';
import 'features/auth/phone_number_opt_varification/view/screens/phone_number_opt_varification_screen.dart';
import 'features/auth/signin/view/screens/signin_screen.dart';
import 'features/auth/signup/view/screens/signup_screen.dart';
import 'features/auth/welcome/view/screens/welcome_screen.dart';
import 'features/dashboard/view/dashboard_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  WelcomeScreen.routeName: (_) => const WelcomeScreen(),
  SigninScreen.routeName: (_) => const SigninScreen(),
  SignupScreen.routeName: (_) => const SignupScreen(),
  PhoneNumberOtpVarificationScreen.routeName: (_) =>
      const PhoneNumberOtpVarificationScreen(),
  AccountTypeSelectionScreen.routeName: (_) =>
      const AccountTypeSelectionScreen(),

  //
  DashboardScreen.routeName: (_) => const DashboardScreen(),
};
