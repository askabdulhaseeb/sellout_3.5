import '../enums/core/attachment_type.dart';
export '../enums/core/attachment_type.dart';

class AttachmentEntity {
  const AttachmentEntity({
    required this.createdAt,
    required this.type,
    required this.url,
    required this.originalName,
    required this.fileId,
  });

  final DateTime createdAt;
  final AttachmentType type;
  final String url;
  final String originalName;
  final String fileId;
}
