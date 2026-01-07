import 'package:flutter/material.dart';

class ContextMenu extends StatelessWidget {
  const ContextMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 105, 105, 105),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Menu 1'),
            Text('Menu 2'),
            Text('Menu 3'),
            Text('Menu 4'),
          ],
        ),
      ),
    );
  }
}
