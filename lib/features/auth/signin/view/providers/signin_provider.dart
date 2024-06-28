import 'package:flutter/material.dart';

class SigninProvider extends ChangeNotifier {
  Future<bool> signin(BuildContext context) async {
    setLoading(true);
    try {
      Future<dynamic>.delayed(const Duration(seconds: 2), () {
        setLoading(false);
      });
    } catch (e) {
      debugPrint('❌ Error in SigninProvider.signin: $e');
    }
    return true;
  }

  // Setters
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Getters
  bool get isLoading => _isLoading;
  TextEditingController get email => _email;
  TextEditingController get password => _password;
  GlobalKey<FormState> get formKey => _formKey;

  // Controllers
  bool _isLoading = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
}
