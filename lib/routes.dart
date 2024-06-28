import 'package:flutter/material.dart';

import 'features/auth/welcome/view/screens/welcome_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  WelcomeScreen.routeName: (_) => const WelcomeScreen(),
};
