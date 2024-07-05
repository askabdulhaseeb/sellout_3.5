import 'dart:convert';

import '../../../../core/ext/string_ext.dart';
import '../../../../core/models/attachment_model.dart';
import '../../domain/entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  ReviewModel({
    required super.reviewBy,
    required super.createdAt,
    required super.fileUrls,
    required super.sellerId,
    required super.businessId,
    required super.rating,
    required super.postId,
    required super.comments,
    required super.text,
    required super.reviewId,
    required super.title,
  });

  factory ReviewModel.fromRawJson(String str) =>
      ReviewModel.fromJson(json.decode(str));

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> files = json['file_urls'] ?? <dynamic>[];
    final List<AttachmentModel> fileUrls = files
        .map((dynamic e) => AttachmentModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return ReviewModel(
      reviewBy: json['review_by'] ?? '',
      createdAt: (json['created_at'] ?? '').toString().toLocalDate(),
      fileUrls: fileUrls,
      sellerId: json['seller_id'] ?? '',
      businessId: json['business_id'] ?? '',
      rating: double.tryParse(json['rating']?.toString() ?? '0.0') ?? 0.0,
      postId: json['post_id'] ?? '',
      comments: List<dynamic>.from(json['comments'].map((dynamic x) => x)),
      text: json['text'] ?? '',
      reviewId: json['review_id'] ?? '',
      title: json['title'] ?? '',
    );
  }
  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => <String, dynamic>{
        'review_by': reviewBy,
        'created_at': createdAt,
        'file_urls': List<dynamic>.from(fileUrls.map((dynamic x) => x)),
        'seller_id': sellerId,
        'business_id': businessId,
        'rating': rating,
        'post_id': postId,
        'comments': List<dynamic>.from(comments.map((dynamic x) => x)),
        'text': text,
        'review_id': reviewId,
        'title': title,
      };
}
