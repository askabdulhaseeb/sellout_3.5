import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

import '../../../../core/enums/core/attachment_type.dart';
import '../domain/pickable_attachment_option.dart';
import '../domain/picked_attachment.dart';

class PickedMediaProvider extends ChangeNotifier {
  Future<void> onSubmit(BuildContext context) async {
    final List<PickedAttachment> attachmentss = <PickedAttachment>[];
    for (final AssetEntity media in _pickedMedia) {
      final File? file = await media.file;
      if (file == null) continue;
      final AttachmentType type = media.type == AssetType.image
          ? AttachmentType.image
          : AttachmentType.video;
      final PickedAttachment attachment = PickedAttachment(
        file: file,
        type: type,
        selectedMedia: media,
      );
      attachmentss.add(attachment);
    }
    clearMedia();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop(attachmentss);
  }

  // Setters

  void setOption(PickableAttachmentOption value) {
    _option = value;
    _pickedMedia.addAll(value.selectedMedia ?? <AssetEntity>[]);
    notifyListeners();
  }

  void addMedia(AssetEntity value) {
    _pickedMedia.add(value);
    notifyListeners();
  }

  void removeMedia(AssetEntity value) {
    _pickedMedia.remove(value);
    notifyListeners();
  }

  void onTap(AssetEntity? value) {
    if (value == null) return;
    if (_pickedMedia.length > _option.maxAttachments) return;
    final bool isOld = _option.selectedMedia?.contains(value) ?? false;
    if (_pickedMedia.contains(value) && !isOld) {
      removeMedia(value);
    } else if (!isOld) {
      addMedia(value);
    }
  }

  int? indexOf(AssetEntity value) {
    final int index = _pickedMedia.indexOf(value);
    return index == -1 ? null : index;
  }

  void clearMedia() {
    _pickedMedia.clear();
    notifyListeners();
  }

  // Getters
  List<AssetEntity> get pickedMedia => _pickedMedia;
  PickableAttachmentOption get option => _option;
  String get selectionStr => '${_pickedMedia.length}/${_option.maxAttachments}';

  // Controllers
  final List<AssetEntity> _pickedMedia = <AssetEntity>[];
  PickableAttachmentOption _option = PickableAttachmentOption();
}
