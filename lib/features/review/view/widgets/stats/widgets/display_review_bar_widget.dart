import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_linear_progress_bar.dart';

class DisplayReviewBarWidget extends StatelessWidget {
  const DisplayReviewBarWidget({
    required this.star,
    required this.count,
    required this.totalLength,
    super.key,
  });
  final int star;
  final int count;
  final int totalLength;

  @override
  Widget build(BuildContext context) {
    const double space = 24;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(width: space, child: Text('$star')),
        CustomLinearProgressBar(
          completed: count,
          total: totalLength,
        ),
        SizedBox(
          width: space,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text('$count'),
          ),
        ),
      ],
    );
  }
}
