//hack to make all the previews throuout the project work
import 'package:fastexplorer/app/views/state/files.state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget providerWrapper(Widget widget) {
  return MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => FilesVM())],
    child: widget,
  );
}

class Util {
  static String truncateString(String value, int max) {
    if (value.length <= max) {
      return value;
    }

    return '${value.substring(0, max)}...';
  }
}
