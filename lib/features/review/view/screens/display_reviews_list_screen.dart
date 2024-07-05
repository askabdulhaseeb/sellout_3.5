import 'package:flutter/material.dart';

import '../../../../core/sources/apis/data_state.dart';
import '../../../../core/sources/local/auth/local_auth.dart';
import '../../../../core/sources/local/local_review.dart';
import '../../../../core/widgets/loader.dart';
import '../../../error/view/screens/error_screen.dart';
import '../../data/sources/get_reviews_api.dart';
import '../../domain/entities/review_entity.dart';
import '../widgets/stats/display_review_stats_wisget.dart';
import '../widgets/tile/review_list_tile.dart';

class DisplayReviewsListScreen extends StatelessWidget {
  const DisplayReviewsListScreen({super.key});
  static const String routeName = '/review';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
      ),
      body: FutureBuilder<DataState<List<ReviewEntity>>>(
        future:
            GetReviewsApi().getReviews(id: LocalAuth.uid ?? '', sellerID: true),
        initialData:
            LocalReview().reviewsState(id: LocalAuth.uid ?? '', sellerID: true),
        builder: (
          BuildContext context,
          AsyncSnapshot<DataState<List<ReviewEntity>>> snapshot,
        ) {
          final DataState<List<ReviewEntity>> data = snapshot.data!;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          } else if (snapshot.hasError) {
            return const ErrorScreen();
          } else if (snapshot.hasData && data is DataSuccess) {
            final List<ReviewEntity> reviews = data.entity ?? <ReviewEntity>[];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: <Widget>[
                  DisplayReviewStatsSection(reviews: reviews),
                  const SizedBox(height: 16),
                  ListView.builder(
                    itemCount: reviews.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (BuildContext context, int index) {
                      final ReviewEntity review = reviews[index];
                      return ReviewListTile(review: review);
                    },
                  ),
                ],
              ),
            );
          } else {
            return const ErrorScreen();
          }
        },
      ),
    );
  }
}
