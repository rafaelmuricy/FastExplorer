import 'dart:io';
import 'package:fastexplorer/app/models/fileitem.module.dart';

class FileService {
  static double iconSize = 30;

  static List<FileItemModel> getItemsFake(String path) {
    List<FileItemModel> items = [];

    for (var i = 0; i < 100; i++) {
      items.add(
        FileItemModel(name: 'name $i', path: 'path $i', type: 'type $i'),
      );
    }

    items.shuffle();

    return items;
  }

  static Future<List<FileItemModel>> getItems(
    String path, {
    bool withSize = false,
  }) async {
    List<FileSystemEntity> files = [];

    try {
      files = await Directory(path).list().toList();
    } catch (e) {
      return [];
    }

    //hack to show directories first
    // ignore: prefer_iterable_wheretype
    var dirs = files.where((element) => element is Directory).toList();
    // ignore: prefer_iterable_wheretype
    var fils = files.where((element) => element is File).toList();
    dirs.addAll(fils);

    files = dirs;

    var items = files.map((e) {
      return FileItemModel(
        name: e.path.split('\\').last,
        path: e.path,
        type: e is Directory ? 'Directory' : 'File',
      );
    }).toList();

    return items;
  }
}
