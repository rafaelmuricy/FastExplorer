import 'package:fastexplorer/app/views/screens/main.screen.dart';
import 'package:fastexplorer/app/views/screens/settings.screen.dart';
import 'package:fastexplorer/app/views/state/files.state.dart';
import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key, required this.vmRead, required this.vm});

  final FilesVM vmRead;
  final FilesVM vm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.upload_sharp),
          onPressed: () {
            vmRead.navigateBack();
          },
        ),
        centerTitle: true,
        title: Text(vm.path),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              vmRead.navigateTo(vm.path);
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      //body: MainScreen(),
      body: MainScreen(),
    );
  }
}
