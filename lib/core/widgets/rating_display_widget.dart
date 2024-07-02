import 'package:flutter/material.dart';

class RatingDisplayWidget extends StatelessWidget {
  const RatingDisplayWidget({
    required this.ratingList,
    this.maxRating = 5,
    super.key,
  });
  final int maxRating;
  final List<double> ratingList;

  @override
  Widget build(BuildContext context) {
    final double rating = ratingList.isEmpty
        ? 0
        : ratingList.reduce((double a, double b) => a + b) / ratingList.length;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          rating.toStringAsFixed(1),
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        const SizedBox(width: 4),
        Text(
          '(${ratingList.length})',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        const SizedBox(width: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List<Widget>.generate(
            maxRating,
            (int index) {
              final bool isFilled = index < rating;
              final bool isHalf = index == rating.floor();
              final bool isHalfStar = rating % 1 != 0 && isHalf;
              return Icon(
                isFilled && !isHalf
                    ? Icons.star
                    : isHalfStar
                        ? Icons.star_half
                        : Icons.star_border,
                size: 16,
                color: isFilled ? Theme.of(context).primaryColor : Colors.grey,
              );
            },
          ),
        ),
      ],
    );
  }
}
