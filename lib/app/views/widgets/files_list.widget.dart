import 'dart:developer';
import 'package:fastexplorer/app/util/provider_wrapper.dart';
import 'package:fastexplorer/app/views/state/files.state.dart';
import 'package:fastexplorer/app/views/widgets/context_menu.widget.dart';
import 'package:fastexplorer/app/views/widgets/file_item.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:provider/provider.dart';

class FilesListWidget extends StatelessWidget {
  @Preview(wrapper: providerWrapper)
  const FilesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<FilesVM>();
    var vmRead = context.read<FilesVM>();
    return Expanded(
      child: Stack(
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              mainAxisExtent: 150,
              // largura máxima de cada item
              //mainAxisSpacing: 8,
              //crossAxisSpacing: 8,
              //childAspectRatio: 1, // largura / altura
            ),

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
                child: FileItemWidget(
                  name: vm.files[index].name,
                  path: vm.files[index].path,
                  type: vm.files[index].type,
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
