import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/widgets/custom_elevation_button.dart';
import '../../../../../core/widgets/sellout_title.dart';
import '../../../signup/view/providers/signup_provider.dart';
import '../widgets/account_type_list_widget.dart';

class AccountTypeSelectionScreen extends StatelessWidget {
  const AccountTypeSelectionScreen({super.key});
  static const String routeName = '/account-type-selection';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const SellOutTitle()),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Select Account Type',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 24),
            const AccountTypeListWidget(),
            CustomElevatedButton(
              title: 'Next',
              isLoading: false,
              onTap: () => Provider.of<SignupProvider>(context, listen: false)
                  .onAccountSelectionComplete(context),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
