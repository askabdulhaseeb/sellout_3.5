import 'package:flutter/material.dart';

import '../../../../../../core/widgets/rating_display_widget.dart';
import '../../../../data/models/user_model.dart';

class ProfileHeaderInfoWidget extends StatelessWidget {
  const ProfileHeaderInfoWidget({required this.user, super.key});
  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      margin: const EdgeInsets.only(right: 16, top: 12, bottom: 16, left: 8),
      padding: const EdgeInsets.only(left: 8, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 8),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        user.fullName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: Implement edit user
                      },
                      child: const Text('Edit'),
                    ),
                  ],
                ),
                Text(user.token, maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          //
          Row(
            children: <Widget>[
              RatingDisplayWidget(ratingList: user.ratings),
            ],
          ),
        ],
      ),
    );
  }
}
