import 'package:shared_preferences/shared_preferences.dart';

class LocalState {
  static late SharedPreferences _preferences;
  static Future<SharedPreferences> init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future<void> signout() => _preferences.clear();

  static const String _key = 'selected_currency_key';

  static Future<void> saveCurrency(String currency) async =>
      await _preferences.setString(_key, currency);

  static String getCurrency() => _preferences.getString(_key) ?? 'usd';
}
