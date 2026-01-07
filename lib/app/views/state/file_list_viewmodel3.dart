import 'package:fastexplorer/app/models/fileitem.module.dart';
import 'package:fastexplorer/app/services/file.service.dart';
import 'package:flutter/material.dart';

class FileListViewModel3 extends ChangeNotifier {
  final String _separator = '\\';

  String path = 'C:\\';
  List<FileItemModel> files = [];

  Future<void> navigateTo(String path) async {
    this.path = path;
    files = await FileService.getItems(path);
    notifyListeners();
  }

  void navigateBack() {
    if (path.split(_separator).length == 1) return;

    var lastDir = path.split(_separator).last;
    var parentDir = path
        .split(_separator)
        .where((x) => x != lastDir)
        .join("\\");

    navigateTo(parentDir);
  }

  void setSelected(int index) {
    for (var element in files) {
      element.selected = false;
    }
    files[index].selected = true;
    notifyListeners();
  }
}
