import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/sources/apis/data_state.dart';
import '../../../../dashboard/view/screens/dashboard_screen.dart';
import '../../data/models/current_user_model.dart';
import '../../data/soruces/signin_api.dart';

class SigninProvider extends ChangeNotifier {
  Future<void> signin(BuildContext context) async {
    setLoading(true);
    try {
      final DataState<bool> result = await SigninAPI().signin(
        email: email.text,
        password: password.text,
      );
      if (result is DataSuccess) {
        // Current User
        final CurrentUserEntity currentUser =
            CurrentUserModel.fromRawJson(result.data ?? '');
        debugPrint(
          '👉🏻 SigninProvider.signin: $currentUser'
          '\n👉🏻 SigninProvider.signin: ${currentUser.email}'
          '\n👉🏻 SigninProvider.signin: ${currentUser.token}'
          '\n👉🏻 SigninProvider.signin: ${currentUser.userName}'
          '\n👉🏻 SigninProvider.signin: ${currentUser.userId}'
          '\n👉🏻 SigninProvider.signin: ${currentUser.fullName}',
        );
        // Navigator
        // ignore: use_build_context_synchronously
        Navigator.of(context)
            .pushNamedAndRemoveUntil(DashboardScreen.routeName, (_) => false);
      } else if (result is DataFailer) {
        debugPrint('❌ Error in SigninProvider.signin: $result');
      }
    } catch (e) {
      debugPrint('❌ Error in SigninProvider.signin: $e');
    }
    setLoading(false);
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
  final TextEditingController _email = TextEditingController(
    text: kDebugMode ? 'test@gmail.com' : '',
  );
  final TextEditingController _password =
      TextEditingController(text: kDebugMode ? '123' : '');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
}
