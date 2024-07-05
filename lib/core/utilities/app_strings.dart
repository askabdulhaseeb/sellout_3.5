import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppStrings {
  // Hive Boxes
  static String get localAuthBox => 'local-auth';
  static String get localUsersBox => 'local-users';
  static String get localRequestHistory => 'request_history';
  static String get localReviewBox => 'local-review';
  // API
  String get baseURL => dotenv.env['baseURL'] ?? '';
}
