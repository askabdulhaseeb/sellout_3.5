import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_textformfield.dart';
import '../../../../../core/widgets/password_textformfield.dart';
import '../providers/signin_provider.dart';

class SigninFormWidget extends StatefulWidget {
  const SigninFormWidget({super.key});

  @override
  State<SigninFormWidget> createState() => _SigninFormWidgetState();
}

class _SigninFormWidgetState extends State<SigninFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SigninProvider>(
        builder: (BuildContext context, SigninProvider signinPro, _) {
      return Form(
        key: signinPro.formKey,
        child: Column(
          children: <Widget>[
            CustomTextFormField(
              controller: signinPro.email,
              labelText: 'Sellout Email',
              keyboardType: TextInputType.emailAddress,
            ),
            PasswordTextFormField(
              controller: signinPro.password,
              labelText: 'Password',
            ),
          ],
        ),
      );
    });
  }
}
