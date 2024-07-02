import 'package:flutter/material.dart';

import '../../../domain/entities/user_entity.dart';
import 'widgets/profile_my_order_button_widget.dart';
import 'widgets/profile_suppoter_display_widget.dart';

class ProfileSupporterStatsSection extends StatelessWidget {
  const ProfileSupporterStatsSection({required this.user, super.key});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            const Expanded(child: ProfileMyOrderButtonWidget()),
            const SizedBox(width: 8),
            Expanded(
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: ProfileSuppoterDisplayWidget(
                      count: 7,
                      title: 'Supporting',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: ProfileSuppoterDisplayWidget(
                      count: 3,
                      title: 'Supporters',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
