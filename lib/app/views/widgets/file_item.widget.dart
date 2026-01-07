import 'package:fastexplorer/app/util/provider_wrapper.dart';
import 'package:flutter/material.dart';

class FileItemWidget extends StatelessWidget {
  const FileItemWidget({
    super.key,
    required this.path,
    required this.name,
    required this.type,
  });

  final String path;
  final String name;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(
            size: 50,
            type == 'Directory'
                ? Icons.folder_copy_outlined
                : Icons.file_copy_outlined,
          ),
          Text(textAlign: TextAlign.center, Util.truncateString(name, 38)),
        ],
      ),
    );
  }
}
