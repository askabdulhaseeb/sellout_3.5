import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppStrings {
  // Hive Boxes
  static String get localAuthBox => 'local-auth';
  // API
  String get baseURL => dotenv.env['baseURL'] ?? '';
}
