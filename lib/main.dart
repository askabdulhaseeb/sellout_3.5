import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'core/sources/local/auth/local_auth.dart';
import 'core/sources/local/core/hive_db.dart';
import 'features/auth/welcome/view/screens/welcome_screen.dart';
import 'features/dashboard/view/screens/dashboard_screen.dart';
import 'providers.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await HiveDB.init();
  // setUrlStrategy(PathUrlStrategy());  ->  import 'package:flutter_web_plugins/flutter_web_plugins.dart';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFFBF1017);
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'SellOut',
        theme: ThemeData(
          primaryColor: primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
        home: LocalAuth.currentUser == null
            ? const WelcomeScreen()
            : const DashboardScreen(),
        routes: routes,
        // onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}

// flutter packages pub run build_runner build --delete-conflicting-outputs
// flutter packages pub run build_runner build