import 'dart:developer';

import 'package:fastexplorer/app/util/provider_wrapper.dart';
import 'package:fastexplorer/app/views/state/files.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @Preview()
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return providerWrapper(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SeparatorWidget(),
      ),
    );
  }
}

class SeparatorWidget extends StatelessWidget {
  const SeparatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<FilesVM>();
    final height = MediaQuery.of(context).size.height - 76;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// ITEM ARRASTÁVEL
        Draggable<String>(
          onDragUpdate: (details) {
            log('DX: ${details.globalPosition.dx.toString()}');
            vm.setSeparatorPosition(details.globalPosition.dx);
          },
          feedback: _buildDragItem(height: height, isDragging: true),
          childWhenDragging: Opacity(opacity: 0, child: _buildDragItem()),
          child: _buildDragItem(height: height),
        ),
      ],
    );
  }

  Widget _buildDragItem({double height = 400, bool isDragging = false}) {
    return MouseRegion(
      cursor: SystemMouseCursors.resizeLeftRight,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 4,
          height: height,
          //padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            color: isDragging ? Colors.blueAccent : Colors.blue,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              if (!isDragging)
                const BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
