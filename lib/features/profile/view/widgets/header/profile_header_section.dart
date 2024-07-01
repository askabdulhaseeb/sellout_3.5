import 'package:flutter/material.dart';

import '../../../../../core/widgets/profile_photo_widget.dart';
import '../../../data/models/user_model.dart';
import 'widgets/profile_header_info_widget.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({required this.user, super.key});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: AspectRatio(
        aspectRatio: 4 / 2,
        child: Row(
          children: <Widget>[
            const SizedBox(width: 16),
            Expanded(
              flex: 3,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: ProfilePhotoWidget(
                  photoUrl: user.profilePic,
                  size: null,
                ),
              ),
            ),
            Expanded(flex: 5, child: ProfileHeaderInfoWidget(user: user)),
          ],
        ),
      ),
    );
  }
}
