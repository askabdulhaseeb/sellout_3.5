import 'package:flutter/material.dart';

import '../../../../../../core/widgets/rating_display_widget.dart';
import '../../../../domain/entities/review_entity.dart';

class DisplayReviewStatusStarWidget extends StatelessWidget {
  const DisplayReviewStatusStarWidget({required this.reviews, super.key});
  final List<ReviewEntity> reviews;

  @override
  Widget build(BuildContext context) {
    final int length = reviews.length;
    final double rating = reviews.isEmpty
        ? 0
        : reviews
                .map((ReviewEntity review) => review.rating)
                .reduce((double a, double b) => a + b) /
            length;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodySmall,
            children: <TextSpan>[
              TextSpan(
                text: rating.toStringAsFixed(1),
                style: const TextStyle(fontSize: 24),
              ),
              const TextSpan(text: '/5', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RatingDisplayWidget(
              ratingList: <double>[rating],
              displayPrefix: false,
              size: 24,
            ),
            Opacity(
              opacity: 0.5,
              child: Text('$length Reviews'),
            ),
          ],
        )
      ],
    );
  }
}
