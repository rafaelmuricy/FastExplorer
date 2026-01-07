import 'dart:developer';

import 'package:fastexplorer/app/util/provider_wrapper.dart';
import 'package:fastexplorer/app/views/state/files.state.dart';
import 'package:fastexplorer/app/views/widgets/top_bar.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widget_previews.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(providerWrapper(FastExplorer()));
}

class FastExplorer extends StatelessWidget {
  @Preview(wrapper: providerWrapper)
  const FastExplorer({super.key});

  @override
  Widget build(BuildContext context) {
    var vmRead = context.read<FilesVM>();
    var vm = context.watch<FilesVM>();

    return GestureDetector(
      onTap: () {
        vmRead.setShowContextMenu(false);
        log('Click global');
      },

      child: KeyboardListener(
        focusNode: FocusNode()..requestFocus(),
        onKeyEvent: (event) {
          if (event is KeyDownEvent) {
            log(event.logicalKey.keyLabel);
          }
        },
        child: MaterialApp(
          showPerformanceOverlay: false,
          debugShowCheckedModeBanner: false,
          title: 'FastExplorer',

          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 65, 130, 252),
              brightness: Brightness.dark,
            ),

            hoverColor: Color.fromARGB(255, 80, 80, 80),
          ),
          home: TopBarWidget(vmRead: vmRead, vm: vm),
        ),
      ),
    );
  }
}
