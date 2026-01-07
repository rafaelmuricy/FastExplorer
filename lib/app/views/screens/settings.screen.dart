import 'package:fastexplorer/app/views/state/files.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @Preview()
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<FilesVM>();
    var vmRead = context.read<FilesVM>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text('Settings'),
      ),
      //body: MainScreen(),
      body: Column(
        children: [
          SizedBox(height: 40),
          Text('Display files like:', style: TextStyle(fontSize: 18)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Grid'),
              SizedBox(
                width: 100,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Switch(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    value: vm.filesGrid,
                    activeTrackColor: Colors.green,
                    onChanged: (bool? value) {
                      vmRead.setFilesGrid(value ?? true);
                    },
                  ),
                ),
              ),
              Text('List'),
            ],
          ),
        ],
      ),
    );
  }
}
