import 'dart:io';

import 'package:fastexplorer/app/models/fileitem.module.dart';
import 'package:fastexplorer/app/services/file.service.dart';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';

class FilesVM extends ChangeNotifier {
  FilesVM() {
    FileService.getItems('C:\\').then((value) {
      files = value;
      notifyListeners();
    });
  }

  List<FileItemModel> files = [];

  //selected file
  String path = 'C:\\';
  String pathName = 'C:\\';
  String name = '';
  String type = '';

  //preview
  double separatorPosition = 0;
  String previewContent = '';
  String previewType = '';

  //context menu
  bool showContextMenu = false;
  double contextMenuLeft = 0;
  double contextMenuTop = 0;

  //settings
  bool filesGrid = true;

  void setContextMenuPosition(double x, double y) {
    contextMenuLeft = x;
    contextMenuTop = y - 56;
    showContextMenu = true;
    notifyListeners();
  }

  void setShowContextMenu(bool value) {
    showContextMenu = value;
    notifyListeners();
  }

  void setSeparatorPosition(double value) {
    separatorPosition = value;
    notifyListeners();
  }

  void setFilesGrid(bool value) {
    filesGrid = value;
    notifyListeners();
  }

  Future<void> click(String path, String type) async {
    if (type == 'Directory') {
      await navigateTo(path);
    } else {
      pathName = path;
      name = path.split('\\').last;

      var fileType = lookupMimeType(path);

      if (fileType != null && fileType.startsWith('image')) {
        //load image
        previewType = 'image';
      } else {
        previewType = '';
        try {
          File file = File(path);

          previewContent = await file.readAsString();
        } catch (e) {
          //
          previewContent = fileType ?? e.toString();
        }
      }

      notifyListeners();
    }
  }

  Future<void> navigateTo(String path) async {
    this.path = path;
    files = await FileService.getItems(path);
    notifyListeners();
  }

  void navigateBack() {
    if (path.split('\\').length == 1) return;

    var lastDir = path.split('\\').last;
    var parentDir = path.split('\\').where((x) => x != lastDir).join("\\");

    navigateTo(parentDir);
  }

  void setSelected(int index) {
    for (var element in files) {
      element.selected = false;
    }
    files[index].selected = true;
    notifyListeners();
  }

  void clearPreview() {
    name = '';
    previewContent = '';
    notifyListeners();
  }
}
