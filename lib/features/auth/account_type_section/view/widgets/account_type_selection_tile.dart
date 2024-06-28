import 'package:flutter/material.dart';

import '../../../../../core/enums/user/user_type.dart';

class AccountTypeSelectionTile extends StatelessWidget {
  const AccountTypeSelectionTile({
    required this.type,
    required this.isSelected,
    required this.onSelected,
    super.key,
  });

  final UserType type;
  final bool isSelected;
  final void Function(UserType) onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () => onSelected(type),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
              width: isSelected ? 1 : 0.5,
            ),
          ),
          child: Row(
            children: <Widget>[
              Text(
                type.display,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Spacer(),
              if (isSelected)
                Icon(
                  Icons.check,
                  color: Theme.of(context).primaryColor,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
