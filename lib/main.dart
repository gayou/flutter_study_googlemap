import 'package:flutter/material.dart';

import 'map_ui.dart';


void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GoogleMaps examples')),
      body: MapUiPage(),
      bottomNavigationBar: new BottomNavigationBar(
          items: [
            new BottomNavigationBarItem(
              icon: const Icon(Icons.star),
              title: new Text('Title'),
            ),

            new BottomNavigationBarItem(
              icon: const Icon(Icons.star),
              title: new Text('Title'),
            ),

            new BottomNavigationBarItem(
              icon: const Icon(Icons.star),
              title: new Text('Title'),
            ),

            new BottomNavigationBarItem(
              icon: const Icon(Icons.star),
              title: new Text('Title'),
            )
          ]

      ),
    );
  }
}

