import 'package:flutter/material.dart';

import '../../../../domain/entities/review_entity.dart';
import 'display_review_bar_widget.dart';

class DisplayReviewStatChartWidget extends StatelessWidget {
  const DisplayReviewStatChartWidget({required this.review, super.key});
  final List<ReviewEntity> review;

  @override
  Widget build(BuildContext context) {
    final int length = review.length;
    final int fiveStar =
        review.where((ReviewEntity review) => review.rating == 5).length;
    final int fourStar = review
        .where((ReviewEntity review) => review.rating >= 4 && review.rating < 5)
        .length;
    final int threeStar = review
        .where((ReviewEntity review) => review.rating >= 3 && review.rating < 4)
        .length;
    final int twoStar = review
        .where((ReviewEntity review) => review.rating >= 2 && review.rating < 3)
        .length;
    final int oneStar =
        review.where((ReviewEntity review) => review.rating < 2).length;
    return Column(
      children: <Widget>[
        DisplayReviewBarWidget(star: 5, count: fiveStar, totalLength: length),
        DisplayReviewBarWidget(star: 4, count: fourStar, totalLength: length),
        DisplayReviewBarWidget(star: 3, count: threeStar, totalLength: length),
        DisplayReviewBarWidget(star: 2, count: twoStar, totalLength: length),
        DisplayReviewBarWidget(star: 1, count: oneStar, totalLength: length),
      ],
    );
  }
}
