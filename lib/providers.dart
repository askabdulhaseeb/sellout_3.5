import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'features/auth/signin/view/providers/signin_provider.dart';
import 'features/auth/signup/view/providers/signup_provider.dart';
import 'features/dashboard/view/providers/app_nav_bar_provider.dart';
import 'features/listing/add_listing_form/view/providers/add_listing_form_provider.dart';

final List<SingleChildWidget> providers = <SingleChildWidget>[
  // Add your providers here
  ChangeNotifierProvider<SigninProvider>.value(value: SigninProvider()),
  ChangeNotifierProvider<SignupProvider>.value(value: SignupProvider()),
  //
  ChangeNotifierProvider<AppNavBarProvider>.value(value: AppNavBarProvider()),
  //
  ChangeNotifierProvider<AddListingFormProvider>.value(
      value: AddListingFormProvider()),
];
