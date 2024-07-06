import 'package:flutter/material.dart';

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
import 'features/listing/add_listing/view/screens/sub_screens/add_cloths_and_footwear_screen.dart';
import 'features/listing/add_listing/view/screens/sub_screens/add_food_and_drink_screen.dart';
import 'features/listing/add_listing/view/screens/sub_screens/add_item_screen.dart';
import 'features/listing/add_listing/view/screens/sub_screens/add_pet_screen.dart';
import 'features/listing/add_listing/view/screens/sub_screens/add_property_screen.dart';
import 'features/listing/add_listing/view/screens/sub_screens/add_vehicle_screen.dart';
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
  AddItemScreen.routeName: (_) => const AddItemScreen(),
  AddClothsAndFootwearScreen.routeName: (_) =>
      const AddClothsAndFootwearScreen(),
  AddVehicleScreen.routeName: (_) => const AddVehicleScreen(),
  AddFoodAndDrinkScreen.routeName: (_) => const AddFoodAndDrinkScreen(),
  AddPropertyScreen.routeName: (_) => const AddPropertyScreen(),
  AddPetScreen.routeName: (_) => const AddPetScreen(),
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
