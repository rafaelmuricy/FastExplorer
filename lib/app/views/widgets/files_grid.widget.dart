import 'dart:developer';
import 'package:fastexplorer/app/util/provider_wrapper.dart';
import 'package:fastexplorer/app/views/state/files.state.dart';
import 'package:fastexplorer/app/views/widgets/context_menu.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:provider/provider.dart';

class FilesGrid extends StatelessWidget {
  @Preview(wrapper: providerWrapper)
  const FilesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<FilesVM>();
    var vmRead = context.read<FilesVM>();
    return Expanded(
      child: Stack(
        children: [
          ListView.builder(
            itemCount: vm.files.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  log('tap');
                  vmRead.click(vm.files[index].path, vm.files[index].type);
                },
                onSecondaryTapDown: (TapDownDetails details) {
                  log(details.toString());
                  vmRead.setContextMenuPosition(
                    details.globalPosition.dx,
                    details.globalPosition.dy,
                  );
                },
                child: Padding(
                  padding: EdgeInsetsGeometry.directional(
                    start: 5,
                    end: 5,
                    top: 2,
                    bottom: 2,
                  ),
                  child: Row(
                    spacing: 10,
                    children: [
                      Icon(
                        vm.files[index].type == 'Directory'
                            ? Icons.folder_copy_outlined
                            : Icons.file_copy_outlined,
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Text(vm.files[index].name),
                      ),
                      Text(vm.files[index].type),
                    ],
                  ),
                ),
              );
            },
          ),
          if (vm.showContextMenu)
            Positioned(
              top: vm.contextMenuTop,
              left: vm.contextMenuLeft,
              child: ContextMenu(),
            ),
        ],
      ),
    );
  }
}
