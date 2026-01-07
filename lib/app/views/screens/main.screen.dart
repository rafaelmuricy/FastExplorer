import 'package:fastexplorer/app/util/provider_wrapper.dart';
import 'package:fastexplorer/app/views/state/files.state.dart';
import 'package:fastexplorer/app/views/widgets/files_grid.widget.dart';
import 'package:fastexplorer/app/views/widgets/files_list.widget.dart';
import 'package:fastexplorer/app/views/widgets/preview.widget.dart';
import 'package:fastexplorer/app/views/widgets/separator.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  @Preview(wrapper: providerWrapper)
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //var vm = Provider.of<TesteVM>(context);
    var vm = context.watch<FilesVM>();
    return Column(
      children: [
        Expanded(
          //height: 500,
          child: Row(
            children: [
              if (vm.filesGrid) FilesGrid() else FilesListWidget(),
              if (vm.previewContent != '') SeparatorWidget(),
              if (vm.previewContent != '') PreviewWidget(),
            ],
          ),
        ),
        Text('${vm.files.length} items'),
      ],
    );
  }
}
