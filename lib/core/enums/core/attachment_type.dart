import 'package:hive/hive.dart';

part 'attachment_type.g.dart';

@HiveType(typeId: 5)
enum AttachmentType {
  @HiveField(0)
  image('image', 'image'),
  @HiveField(1)
  video('video', 'video'),
  @HiveField(2)
  audio('audio', 'audio'),
  @HiveField(3)
  document('document', 'document'),
  @HiveField(4)
  other('other', 'other');

  const AttachmentType(this.json, this.title);

  final String json;
  final String title;

  static AttachmentType fromString(String? value) {
    if (value == null) return AttachmentType.other;
    switch (value) {
      case 'image':
        return AttachmentType.image;
      case 'video':
        return AttachmentType.video;
      case 'audio':
        return AttachmentType.audio;
      case 'document':
        return AttachmentType.document;
      default:
        return AttachmentType.other;
    }
  }
}
