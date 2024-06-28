import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/enums/user/user_type.dart';
import '../../../signup/view/providers/signup_provider.dart';
import 'account_type_selection_tile.dart';

class AccountTypeListWidget extends StatelessWidget {
  const AccountTypeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<UserType> userTypes = UserType.list;
    return Consumer<SignupProvider>(
      builder: (_, SignupProvider signupPro, __) {
        return Expanded(
          child: ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: userTypes.length,
            itemBuilder: (_, int index) {
              final UserType type = userTypes[index];
              return AccountTypeSelectionTile(
                type: type,
                isSelected: type == signupPro.selectedUserType,
                onSelected: signupPro.userTypeChanged,
              );
            },
          ),
        );
      },
    );
  }
}
