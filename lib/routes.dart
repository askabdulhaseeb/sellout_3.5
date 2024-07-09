import 'package:flutter/material.dart';

import 'features/attachment_selection/selectable_attachment/screens/pickable_attachment_screen.dart';
import 'features/auth/account_type_section/view/screens/account_type_selection_screen.dart';
import 'features/auth/phone_number_opt_varification/view/screens/phone_number_opt_varification_screen.dart';
import 'features/auth/signin/view/screens/signin_screen.dart';
import 'features/auth/signup/view/screens/signup_screen.dart';
import 'features/auth/welcome/view/screens/welcome_screen.dart';
import 'features/cart/view/screens/cart_screen.dart';
import 'features/dashboard/view/screens/dashboard_screen.dart';
import 'features/error/view/screens/error_screen.dart';
import 'features/home/view/screens/home_screen.dart';
import 'features/listing/add_listing/view/screens/add_listing_screen.dart';
import 'features/listing/add_listing_form/view/screens/add_listing_form_screen.dart';
import 'features/notification/view/screens/notification_screen.dart';
import 'features/review/view/screens/display_reviews_list_screen.dart';
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
  /// Listing
  AddListingScreen.routeName: (_) => const AddListingScreen(),
  AddListingFormScreen.routeName: (_) => const AddListingFormScreen(),
  //
  // Pick Attachment
  PickableAttachmentScreen.routeName: (_) => const PickableAttachmentScreen(),
  //
  /// Reviews
  DisplayReviewsListScreen.routeName: (_) => const DisplayReviewsListScreen(),
};

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  // final List<String> pathElements = settings.name?.split('/') ?? <String>[];
  switch (settings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute<HomeScreen>(builder: (_) => const HomeScreen());
    default:
      return MaterialPageRoute<ErrorScreen>(
          builder: (_) => const ErrorScreen());
  }
}
