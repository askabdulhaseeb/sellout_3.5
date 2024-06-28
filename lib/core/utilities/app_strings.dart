import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppStrings {
  // API
  String get baseURL => dotenv.env['baseURL'] ?? '';
}
