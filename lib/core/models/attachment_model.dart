import 'dart:convert';

import '../entities/attachment_entity.dart';
export '../entities/attachment_entity.dart';

class AttachmentModel extends AttachmentEntity {
  const AttachmentModel({
    required super.createdAt,
    required super.type,
    required super.url,
    required super.originalName,
    required super.fileId,
  });

  factory AttachmentModel.fromRawJson(String str) =>
      AttachmentModel.fromJson(json.decode(str));

  factory AttachmentModel.fromJson(Map<String, dynamic> json) =>
      AttachmentModel(
        createdAt: DateTime.parse(json['created_at']),
        type: AttachmentType.fromString(json['type']),
        url: json['url'],
        originalName: json['original_name'],
        fileId: json['file_id'],
      );
}
