import 'dart:io';

import '../../../../core/enums/core/attachment_type.dart';

class PickedAttachment {
  const PickedAttachment({required this.file, required this.type});

  final File file;
  final AttachmentType type;
}
