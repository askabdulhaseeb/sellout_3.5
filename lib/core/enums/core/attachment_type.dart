enum AttachmentType {
  image('image', 'image'),
  video('video', 'video'),
  audio('audio', 'audio'),
  document('document', 'document'),
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
