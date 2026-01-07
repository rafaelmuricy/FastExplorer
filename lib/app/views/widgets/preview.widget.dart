import 'dart:io';

import 'package:fastexplorer/app/util/provider_wrapper.dart';
import 'package:fastexplorer/app/views/state/files.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:provider/provider.dart';

class PreviewWidget extends StatelessWidget {
  @Preview(wrapper: providerWrapper)
  const PreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<FilesVM>();
    var vmRead = context.read<FilesVM>();

    final media = MediaQuery.of(context);
    final alturaUtil = media.size.height - 116;
    final larguraTotal = media.size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Preview: ${vm.name}'),
            IconButton(
              onPressed: () {
                vmRead.clearPreview();
              },
              icon: Icon(Icons.close),
            ),
          ],
        ),

        SizedBox(
          width: (vm.separatorPosition == 0.0
              ? 300
              : larguraTotal - vm.separatorPosition),
          height: alturaUtil,
          child: vm.previewType == 'image'
              ? (Image.file(File(vm.pathName), fit: BoxFit.contain))
              : SingleChildScrollView(child: Text(vm.previewContent)),
        ),
      ],
    );
  }
}
