import 'package:flutter/material.dart';

import '../../../../../../core/ext/datetime_ext.dart';
import '../../../../../../core/sources/apis/data_state.dart';
import '../../../../../../core/sources/local/local_user.dart';
import '../../../../../../core/widgets/loader.dart';
import '../../../../../../core/widgets/profile_photo_widget.dart';
import '../../../../../../core/widgets/rating_display_widget.dart';
import '../../../../../profile/data/sources/user_api.dart';
import '../../../../domain/entities/review_entity.dart';

class ReviewListTileHeaderWidget extends StatelessWidget {
  const ReviewListTileHeaderWidget({required this.review, super.key});
  final ReviewEntity review;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DataState<UserEntity?>>(
      future: GetUserAPI().user(review.reviewBy),
      initialData: LocalUser().userState(review.reviewBy),
      builder: (
        BuildContext context,
        AsyncSnapshot<DataState<UserEntity?>> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        } else if (snapshot.hasError) {
          return const Text('Error');
        } else if (snapshot.hasData) {
          final UserEntity? user = snapshot.data?.entity;
          return user == null
              ? const SizedBox()
              : Row(
                  children: <Widget>[
                    ProfilePhotoWidget(
                      photoUrl: user.profilePic,
                      size: 42,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          user.fullName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Wrap(
                          children: <Widget>[
                            RatingDisplayWidget(
                              ratingList: <double>[review.rating],
                              displayPrefix: false,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              review.createdAt?.dateOnly ?? 'N/A',
                              style: TextStyle(
                                color: Theme.of(context).disabledColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                );
        } else {
          return const Text('Error');
        }
      },
    );
  }
}
