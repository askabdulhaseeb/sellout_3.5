import 'package:flutter/material.dart';

import '../../../domain/entities/review_entity.dart';
import 'widgets/display_review_stat_chart_widget.dart';
import 'widgets/display_review_status_star_widget.dart';

class DisplayReviewStatsSection extends StatelessWidget {
  const DisplayReviewStatsSection({required this.reviews, super.key});
  final List<ReviewEntity> reviews;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DisplayReviewStatusStarWidget(reviews: reviews),
        DisplayReviewStatChartWidget(review: reviews),
      ],
    );
  }
}
