import 'package:hive_flutter/hive_flutter.dart';

import '../../../features/review/domain/entities/review_entity.dart';
import '../../utilities/app_strings.dart';
import '../apis/data_state.dart';

class LocalReview {
  static final String boxTitle = AppStrings.localReviewBox;
  static Box<ReviewEntity> get _box => Hive.box<ReviewEntity>(boxTitle);

  static Future<Box<ReviewEntity>> get openBox async =>
      await Hive.openBox<ReviewEntity>(boxTitle);

  Future<Box<ReviewEntity>> refresh() async {
    final bool isOpen = Hive.isBoxOpen(boxTitle);
    if (isOpen) {
      return _box;
    } else {
      return await Hive.openBox<ReviewEntity>(boxTitle);
    }
  }

  Future<void> save(ReviewEntity value) async =>
      await _box.put(value.reviewId, value);
  ReviewEntity? reviewEntity(String value) => _box.get(value);

  DataState<ReviewEntity?> reviewState(String value) {
    final ReviewEntity? entity = _box.get(value);
    if (entity != null) {
      return DataSuccess<ReviewEntity?>(value, entity);
    } else {
      return DataFailer<ReviewEntity?>(CustomException('Loading...'));
    }
  }

  DataState<List<ReviewEntity>> reviewsState({
    required String id,
    bool sellerID = false,
    bool reviewID = false,
    bool businessID = false,
    bool reviewBy = false,
  }) {
    List<ReviewEntity> list = <ReviewEntity>[];
    //
    if (sellerID) {
      list = _box.values
          .where((ReviewEntity element) => element.sellerId == id)
          .toList();
    } else if (reviewID) {
      list = _box.values
          .where((ReviewEntity element) => element.reviewId == id)
          .toList();
    } else if (businessID) {
      list = _box.values
          .where((ReviewEntity element) => element.businessId == id)
          .toList();
    } else if (reviewBy) {
      list = _box.values
          .where((ReviewEntity element) => element.reviewBy == id)
          .toList();
    } else {
      return DataFailer<List<ReviewEntity>>(CustomException('Not Found'));
    }
    //
    //
    if (list.isNotEmpty) {
      return DataSuccess<List<ReviewEntity>>('', list);
    } else {
      return DataFailer<List<ReviewEntity>>(CustomException('Loading...'));
    }
  }
}
