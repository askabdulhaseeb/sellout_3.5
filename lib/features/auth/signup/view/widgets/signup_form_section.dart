import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utilities/app_validators.dart';
import '../../../../../core/widgets/custom_textformfield.dart';
import '../../../../../core/widgets/password_textformfield.dart';
import '../providers/signup_provider.dart';

class SignupFormSection extends StatelessWidget {
  const SignupFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupProvider>(
      builder: (BuildContext context, SignupProvider signupPro, _) {
        return Form(
          key: signupPro.formKey,
          child: Column(
            children: <Widget>[
              CustomTextFormField(
                controller: signupPro.name,
                hint: 'Ex. Jone Snow',
                labelText: 'Full Name',
                readOnly: signupPro.isLoading,
                keyboardType: TextInputType.name,
                validator: AppValidator.isEmpty,
              ),
              CustomTextFormField(
                controller: signupPro.username,
                hint: 'Ex. jone_snow',
                labelText: 'Username',
                readOnly: signupPro.isLoading,
                keyboardType: TextInputType.name,
                validator: AppValidator.isEmpty,
              ),
              CustomTextFormField(
                controller: signupPro.email,
                hint: 'Ex. username@mail.com',
                labelText: 'Email',
                readOnly: signupPro.isLoading,
                keyboardType: TextInputType.emailAddress,
                validator: AppValidator.email,
              ),
              PasswordTextFormField(
                controller: signupPro.password,
                readOnly: signupPro.isLoading,
              ),
            ],
          ),
        );
      },
    );
  }
}
