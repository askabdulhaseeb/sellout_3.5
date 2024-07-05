import 'package:hive/hive.dart';

import '../../../../core/entities/attachment_entity.dart';
export '../../../../core/entities/attachment_entity.dart';

part 'review_entity.g.dart';

@HiveType(typeId: 2)
class ReviewEntity {
  ReviewEntity({
    required this.reviewBy,
    required this.createdAt,
    required this.fileUrls,
    required this.sellerId,
    required this.businessId,
    required this.rating,
    required this.postId,
    required this.comments,
    required this.text,
    required this.reviewId,
    required this.title,
  });

  @HiveField(0)
  final String reviewId;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String text;
  @HiveField(3)
  final String postId;
  @HiveField(4)
  final String sellerId;
  @HiveField(5)
  final String businessId;
  @HiveField(6)
  final String reviewBy;
  @HiveField(7)
  final double rating;
  @HiveField(8)
  final DateTime? createdAt;
  @HiveField(9)
  final List<dynamic> comments;
  @HiveField(10)
  final List<AttachmentEntity> fileUrls;
}
