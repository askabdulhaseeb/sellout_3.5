import 'package:flutter/material.dart';
import 'package:intl_phone_field/phone_number.dart';

import '../../../../../core/enums/user/user_type.dart';
import '../../../../dashboard/view/screens/dashboard_screen.dart';
import '../../../account_type_section/view/screens/account_type_selection_screen.dart';
import '../../../phone_number_opt_varification/view/screens/phone_number_opt_varification_screen.dart';

class SignupProvider extends ChangeNotifier {
  Future<void> onSignup(BuildContext context) async {
    try {
      // Set loading to true
      setIsLoading(true);
      // Perform signup logic
      // Set loading to false
      setIsLoading(false);
      // Navigate to the next screen
      Navigator.of(context)
          .pushNamed(PhoneNumberOtpVarificationScreen.routeName);
    } catch (e) {
      debugPrint('❌ Error SignupProvider.onSignup: $e');
    }
  }

  Future<void> onOtpVarification(BuildContext context,
      {required String value}) async {
    try {
      // Perform otp varification logic
      // Navigate to the next screen
      Navigator.of(context).pushNamed(AccountTypeSelectionScreen.routeName);
    } catch (e) {
      debugPrint('❌ Error SignupProvider.onOtpVarification: $e');
    }
  }

  Future<void> resendOtp(BuildContext context) async {
    try {
      // Perform resend otp logic
    } catch (e) {
      debugPrint('❌ Error SignupProvider.resendOtp: $e');
    }
  }

  Future<void> onAccountSelectionComplete(BuildContext context) async {
    try {
      // Perform account selection complete logic
      Navigator.of(context).pushNamed(DashboardScreen.routeName);
    } catch (e) {
      debugPrint('❌ Error SignupProvider.onAccountSelectionComplete: $e');
    }
  }

  // Setters
  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void phoneNumberChanged(PhoneNumber value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void userTypeChanged(UserType value) {
    _selectedUserType = value;
    notifyListeners();
  }

  // Getters
  bool get isLoading => _isLoading;
  TextEditingController get name => _name;
  TextEditingController get username => _username;
  PhoneNumber? get phoneNumber => _phoneNumber;
  TextEditingController get email => _email;
  TextEditingController get password => _password;
  GlobalKey<FormState> get formKey => _formKey;
  UserType? get selectedUserType => _selectedUserType;
  // Controllers
  bool _isLoading = false;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _username = TextEditingController();
  PhoneNumber? _phoneNumber;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserType? _selectedUserType;
}
