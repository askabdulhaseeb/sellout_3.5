import 'package:flutter/material.dart';

class ProfileMyOrderButtonWidget extends StatelessWidget {
  const ProfileMyOrderButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: Theme.of(context).disabledColor.withOpacity(0.2),
        ),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(8),
        child: Center(
          child: Text(
            'My Orders',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
