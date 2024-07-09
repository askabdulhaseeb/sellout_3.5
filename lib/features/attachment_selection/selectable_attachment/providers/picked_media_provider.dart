import 'dart:io';

import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class PickedMediaProvider extends ChangeNotifier {
  Future<List<File>> onSubmit(BuildContext context) async {
    final List<File> files = <File>[];
    for (final AssetEntity media in _pickedMedia) {
      final File? file = await media.file;
      if (file != null) files.add(file);
    }
    clearMedia();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop(files);
    return files;
  }

  // Setters
  void setMaxSelectable(int value) {
    _maxSelectable = value;
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
    if (_pickedMedia.length > _maxSelectable) return;

    if (_pickedMedia.contains(value)) {
      removeMedia(value);
    } else {
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
  int get maxSelectable => _maxSelectable;
  String get selectionStr => '${_pickedMedia.length}/$_maxSelectable';

  // Controllers
  final List<AssetEntity> _pickedMedia = <AssetEntity>[];
  int _maxSelectable = 10;
}
